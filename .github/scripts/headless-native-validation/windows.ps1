# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation. See LICENSE for details.

param([string]$Evidence, [switch]$ValidateOnly)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# The controller compiles with hosted PowerShell/.NET; no product code is built.
# ValidateOnly compiles and checks pure helpers without calling Windows APIs.
Add-Type -TypeDefinition @'
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using Microsoft.Win32.SafeHandles;

public static class Pr45Native {
    const uint EXTENDED = 0x00080000, SUSPENDED = 4, NO_WINDOW = 0x08000000;
    const uint UNICODE_ENV = 0x400, WAIT_OBJECT_0 = 0, WAIT_TIMEOUT = 258;
    // ConPTY may render the trailing blank as cursor movement; match visible text.
    const string Prompt = "Enter y or N:";

    [StructLayout(LayoutKind.Sequential)] struct SA {
        public int length; public IntPtr descriptor; public int inherit;
    }
    [StructLayout(LayoutKind.Sequential)] struct SI {
        public uint cb; public IntPtr reserved, desktop, title;
        public uint x, y, xSize, ySize, xChars, yChars, fill, flags;
        public ushort show, reservedSize; public IntPtr reserved2, input, output, error;
    }
    [StructLayout(LayoutKind.Sequential)] struct SIX { public SI si; public IntPtr attrs; }
    [StructLayout(LayoutKind.Sequential)] struct PI {
        public IntPtr process, thread; public uint pid, tid;
    }
    [StructLayout(LayoutKind.Sequential)] struct Coord { public short x, y; }
    [StructLayout(LayoutKind.Sequential)] struct BasicLimits {
        public long processTime, jobTime; public uint flags;
        public UIntPtr minWorkingSet, maxWorkingSet; public uint activeProcesses;
        public UIntPtr affinity; public uint priority, scheduling;
    }
    [StructLayout(LayoutKind.Sequential)] struct IO {
        public ulong readOps, writeOps, otherOps, readBytes, writeBytes, otherBytes;
    }
    [StructLayout(LayoutKind.Sequential)] struct JobLimits {
        public BasicLimits basic; public IO io;
        public UIntPtr processMemory, jobMemory, peakProcess, peakJob;
    }
    [DllImport("kernel32.dll", SetLastError=true)] static extern bool CloseHandle(IntPtr h);
    [DllImport("kernel32.dll", SetLastError=true)] static extern bool CreatePipe(out IntPtr r, out IntPtr w, ref SA a, uint size);
    [DllImport("kernel32.dll", SetLastError=true)] static extern bool SetHandleInformation(IntPtr h, uint mask, uint flags);
    [DllImport("kernel32.dll", SetLastError=true)] static extern IntPtr CreateJobObjectW(IntPtr a, IntPtr name);
    [DllImport("kernel32.dll", SetLastError=true)] static extern bool SetInformationJobObject(IntPtr job, int type, ref JobLimits info, uint size);
    [DllImport("kernel32.dll", SetLastError=true)] static extern bool AssignProcessToJobObject(IntPtr job, IntPtr process);
    [DllImport("kernel32.dll", SetLastError=true)] static extern bool TerminateJobObject(IntPtr job, uint code);
    [DllImport("kernel32.dll", SetLastError=true)] static extern bool TerminateProcess(IntPtr process, uint code);
    [DllImport("kernel32.dll", SetLastError=true)] static extern uint ResumeThread(IntPtr thread);
    [DllImport("kernel32.dll", SetLastError=true)] static extern uint WaitForSingleObject(IntPtr h, uint milliseconds);
    [DllImport("kernel32.dll", SetLastError=true)] static extern bool GetExitCodeProcess(IntPtr h, out uint code);
    [DllImport("kernel32.dll", SetLastError=true, CharSet=CharSet.Unicode)]
    static extern bool CreateProcessW(string app, StringBuilder cmd, IntPtr pa, IntPtr ta,
        bool inherit, uint flags, IntPtr env, string cwd, ref SIX si, out PI pi);
    [DllImport("kernel32.dll", SetLastError=true)] static extern bool InitializeProcThreadAttributeList(IntPtr list, int count, uint flags, ref IntPtr bytes);
    [DllImport("kernel32.dll", SetLastError=true)] static extern bool UpdateProcThreadAttribute(IntPtr list, uint flags, IntPtr attribute, IntPtr value, IntPtr size, IntPtr oldValue, IntPtr resultSize);
    [DllImport("kernel32.dll")] static extern void DeleteProcThreadAttributeList(IntPtr list);
    [DllImport("kernel32.dll")] static extern int CreatePseudoConsole(Coord size, IntPtr input, IntPtr output, uint flags, out IntPtr console);
    [DllImport("kernel32.dll")] static extern void ClosePseudoConsole(IntPtr console);
    [DllImport("kernel32.dll", SetLastError=true)] static extern bool WriteFile(IntPtr h, byte[] data, uint count, out uint written, IntPtr overlapped);
    [DllImport("kernel32.dll")] static extern uint SetErrorMode(uint mode);

    static void Check(bool ok, string operation) {
        if (!ok) throw new Win32Exception(Marshal.GetLastWin32Error(), operation);
    }
    static void Close(ref IntPtr h) { if (h != IntPtr.Zero) { CloseHandle(h); h = IntPtr.Zero; } }
    public static string Quote(string arg) {
        return "\"" + Regex.Replace(arg, "(\\\\*)(\"|$)", m =>
            new string('\\', m.Groups[1].Length * 2) + (m.Groups[2].Value == "\"" ? "\\\"" : "")) + "\"";
    }
    public static string Normalize(string text) {
        return Regex.Replace(text, "\u001b\\[[0-?]*[ -/]*[@-~]", "");
    }
    public static int PromptCount(string text) {
        return Regex.Matches(Normalize(text), Regex.Escape(Prompt)).Count;
    }
    static SIX StartupInfo(bool console) {
        var value = new SIX(); value.si.cb = (uint)Marshal.SizeOf<SIX>();
        // Suppress duplication of a redirected parent's standard handles.
        // Null handles are connected to ConPTY, not to its transport pipes.
        // https://github.com/microsoft/terminal/discussions/15814
        if (console) value.si.flags=0x100; // STARTF_USESTDHANDLES, all hStd* NULL
        return value;
    }
    public static void Validate() {
        if (IntPtr.Size != 8 || Marshal.SizeOf<SI>() != 104 || Marshal.SizeOf<SIX>() != 112 ||
            Marshal.SizeOf<JobLimits>() != 144) throw new Exception("x64 Win32 layout mismatch");
        if (Quote("a b") != "\"a b\"" || Quote("C:\\tail\\") != "\"C:\\tail\\\\\"" ||
            Quote("a\"b") != "\"a\\\"b\"") throw new Exception("Windows quoting mismatch");
        if (PromptCount("\u001b[32mEnter y or N: ") != 1 || PromptCount("plain") != 0)
            throw new Exception("Console prompt parser mismatch");
        var pty=StartupInfo(true);
        if (pty.si.flags != 0x100 || pty.si.input != IntPtr.Zero ||
            pty.si.output != IntPtr.Zero || pty.si.error != IntPtr.Zero)
            throw new Exception("ConPTY must suppress redirected parent standard handles");
    }

    sealed class Drain {
        public Thread thread;
        public string error;
        readonly object gate = new object();
        readonly MemoryStream capture = new MemoryStream();
        public string Text { get { lock (gate) return Encoding.UTF8.GetString(capture.ToArray()); } }
        public Drain(IntPtr handle, string path) {
            thread = new Thread(() => {
                try {
                    using (var input = new FileStream(new SafeFileHandle(handle, true), FileAccess.Read))
                    using (var output = new FileStream(path, FileMode.CreateNew, FileAccess.Write, FileShare.Read)) {
                        var buf = new byte[4096]; int count;
                        while ((count = input.Read(buf, 0, buf.Length)) > 0) {
                            lock (gate) {
                                if (capture.Length + count > 8 * 1024 * 1024) {
                                    error = "Output exceeded eight MiB";
                                } else { capture.Write(buf, 0, count); output.Write(buf, 0, count); }
                            }
                        }
                    }
                } catch (Exception ex) { error = ex.Message; }
            });
            thread.IsBackground = true;
            thread.Start();
        }
    }
    public sealed class Result {
        public uint pid;
        public int? exit_code;
        public double elapsed_seconds;
        public bool sent_n, killed, cleanup_complete;
        public int prompt_count;
        public string output, error;
    }

    // No shell or driver JVM. Each call creates at most one target-image process.
    public static Result Run(string exe, string[] args, string environment, string cwd, bool console) {
        Validate();
        var result = new Result();
        IntPtr job=IntPtr.Zero, inR=IntPtr.Zero, inW=IntPtr.Zero, outR=IntPtr.Zero, outW=IntPtr.Zero;
        IntPtr errR=IntPtr.Zero, errW=IntPtr.Zero, hpc=IntPtr.Zero, attr=IntPtr.Zero, handles=IntPtr.Zero, env=IntPtr.Zero;
        var pi = new PI(); var drains = new List<Drain>(); Thread closer = null;
        bool attributesReady=false;
        var watch = Stopwatch.StartNew();
        uint oldMode = SetErrorMode(0x0001 | 0x0002 | 0x8000);
        try {
            job = CreateJobObjectW(IntPtr.Zero, IntPtr.Zero); Check(job != IntPtr.Zero, "CreateJobObject");
            var limits = new JobLimits(); limits.basic.flags = 0x2000; // KILL_ON_JOB_CLOSE
            Check(SetInformationJobObject(job, 9, ref limits, (uint)Marshal.SizeOf<JobLimits>()), "Set job limits");
            var sa = new SA { length=Marshal.SizeOf<SA>(), inherit=console ? 0 : 1 };
            Check(CreatePipe(out inR, out inW, ref sa, 0), "stdin pipe");
            Check(CreatePipe(out outR, out outW, ref sa, 0), "stdout pipe");
            if (!console) Check(CreatePipe(out errR, out errW, ref sa, 0), "stderr pipe");
            Check(SetHandleInformation(inW, 1, 0), "stdin parent inheritance");
            Check(SetHandleInformation(outR, 1, 0), "stdout parent inheritance");
            if (!console) Check(SetHandleInformation(errR, 1, 0), "stderr parent inheritance");
            var six = StartupInfo(console);
            IntPtr bytes = IntPtr.Zero;
            InitializeProcThreadAttributeList(IntPtr.Zero, 1, 0, ref bytes);
            attr = Marshal.AllocHGlobal(bytes);
            Check(InitializeProcThreadAttributeList(attr, 1, 0, ref bytes), "Initialize attributes");
            attributesReady=true;
            six.attrs = attr;
            if (console) {
                int hr = CreatePseudoConsole(new Coord { x=200, y=60 }, inR, outW, 0, out hpc);
                if (hr != 0) Marshal.ThrowExceptionForHR(hr);
                Check(UpdateProcThreadAttribute(attr, 0, (IntPtr)0x00020016, hpc, (IntPtr)IntPtr.Size,
                                                IntPtr.Zero, IntPtr.Zero), "ConPTY attribute");
            } else {
                six.si.flags = 0x100; // STARTF_USESTDHANDLES
                six.si.input=inR; six.si.output=outW; six.si.error=errW;
                handles = Marshal.AllocHGlobal(3 * IntPtr.Size);
                Marshal.WriteIntPtr(handles, 0, inR); Marshal.WriteIntPtr(handles, IntPtr.Size, outW);
                Marshal.WriteIntPtr(handles, 2 * IntPtr.Size, errW);
                Check(UpdateProcThreadAttribute(attr, 0, (IntPtr)0x00020002, handles, (IntPtr)(3 * IntPtr.Size),
                                                IntPtr.Zero, IntPtr.Zero), "Handle inheritance list");
            }
            var command = new StringBuilder(Quote(exe));
            foreach (var arg in args) command.Append(' ').Append(Quote(arg));
            env = Marshal.StringToHGlobalUni(environment);
            Check(CreateProcessW(exe, command, IntPtr.Zero, IntPtr.Zero, !console,
                EXTENDED | SUSPENDED | UNICODE_ENV | (console ? 0 : NO_WINDOW), env, cwd, ref six, out pi), "CreateProcess");
            result.pid = pi.pid;
            Check(AssignProcessToJobObject(job, pi.process), "Assign suspended child to job");
            // Only the child/ConPTY owns the read/write endpoints below now.
            Close(ref inR); Close(ref outW); Close(ref errW);
            drains.Add(new Drain(outR, Path.Combine(cwd, console ? "console.txt" : "stdout.txt"))); outR=IntPtr.Zero;
            if (!console) { drains.Add(new Drain(errR, Path.Combine(cwd, "stderr.txt"))); errR=IntPtr.Zero; }
            watch.Restart();
            Check(ResumeThread(pi.thread) != 0xffffffff, "Resume child");
            while (watch.Elapsed.TotalSeconds < 30) {
                if (console && !result.sent_n && PromptCount(drains[0].Text) > 0) {
                    byte[] answer = Encoding.ASCII.GetBytes("N\r\n"); uint written;
                    Check(WriteFile(inW, answer, (uint)answer.Length, out written, IntPtr.Zero) && written == answer.Length,
                          "Write single N answer");
                    result.sent_n = true;
                }
                uint status = WaitForSingleObject(pi.process, 25);
                if (status == WAIT_OBJECT_0) break;
                Check(status == WAIT_TIMEOUT, "Wait for child");
            }
            if (WaitForSingleObject(pi.process, 0) != WAIT_OBJECT_0) throw new TimeoutException("30-second child deadline expired");
            uint code; Check(GetExitCodeProcess(pi.process, out code), "Get exit code");
            result.exit_code = unchecked((int)code);
        } catch (Exception ex) { result.error = ex.Message; }
        finally {
            var cleanup = Stopwatch.StartNew();
            // Never let an error or a blocked console close orphan a target VM.
            if (pi.process != IntPtr.Zero && WaitForSingleObject(pi.process, 0) != WAIT_OBJECT_0) {
                result.killed = true;
                TerminateJobObject(job, 0xe0000001);
                TerminateProcess(pi.process, 0xe0000001); // also covers pre-assignment failure
            }
            Close(ref inW); Close(ref inR); Close(ref outW); Close(ref errW);
            if (hpc != IntPtr.Zero) {
                IntPtr closing = hpc; hpc=IntPtr.Zero;
                closer = new Thread(() => ClosePseudoConsole(closing));
                closer.IsBackground=true; closer.Start();
            }
            // Process wait is at most 30s; all cleanup shares one additional 5s budget.
            // A blocked ClosePseudoConsole never blocks the controller thread.
            bool complete=true;
            if (pi.process != IntPtr.Zero) {
                if (WaitForSingleObject(pi.process, (uint)Math.Max(0, 5000-cleanup.ElapsedMilliseconds)) != WAIT_OBJECT_0) complete=false;
            }
            foreach (var drain in drains) {
                if (!drain.thread.Join((int)Math.Max(0,5000-cleanup.ElapsedMilliseconds))) complete=false;
                if (drain.error != null) result.error="Output drain: " + drain.error;
            }
            if (closer != null && !closer.Join((int)Math.Max(0,5000-cleanup.ElapsedMilliseconds))) complete=false;
            result.cleanup_complete=complete;
            if (!complete) result.error=(result.error ?? "") + "; five-second cleanup incomplete";
            if (watch.Elapsed.TotalSeconds > 30 && result.error == null) result.error="30-second process/output deadline expired";
            var output = new StringBuilder(); foreach (var drain in drains) output.Append(drain.Text);
            result.output=output.ToString(); result.prompt_count=PromptCount(result.output);
            result.elapsed_seconds=watch.Elapsed.TotalSeconds;
            Close(ref outR); Close(ref errR); Close(ref pi.thread); Close(ref pi.process); Close(ref job);
            if (attr != IntPtr.Zero) { if (attributesReady) DeleteProcThreadAttributeList(attr); Marshal.FreeHGlobal(attr); }
            if (handles != IntPtr.Zero) Marshal.FreeHGlobal(handles);
            if (env != IntPtr.Zero) Marshal.FreeHGlobal(env);
            SetErrorMode(oldMode);
        }
        return result;
    }
}
'@

function Assert-True([bool]$Value, [string]$Message) {
    if (!$Value) { throw $Message }
}
function Assert-Imports([string]$Text, [bool]$Jli) {
    Assert-True ($Text -notmatch '\b(MessageBox(?:Ex|Indirect)?[AW]|InitCommonControlsEx)\b') 'GUI symbol imported'
    Assert-True ($Text -notmatch '(?im)^\s*(comctl32\.dll|gdi32\.dll|winspool\.drv|comdlg32\.dll)\s*$') 'Excluded GUI DLL imported'
    if ($Jli) { Assert-True ($Text -match '\bCharNextExA\b') 'Required libjli CharNextExA import missing' }
}
function Assert-Fatal($Result, [string]$Log, [bool]$Console, [string]$Revision) {
    Assert-True ([string]::IsNullOrEmpty($Result.error) -and $null -ne $Result.exit_code -and
                 $Result.exit_code -ne 0 -and !$Result.killed -and $Result.cleanup_complete) 'Fatal child failed, timed out or needed cleanup kill'
    Assert-True ($Result.output.Contains('Unexpected Error')) 'Missing console error diagnostic'
    Assert-True ($Result.prompt_count -eq $(if ($Console) {1} else {0}) -and
                 $Result.sent_n -eq $Console) 'Wrong console prompt/input behavior'
    foreach ($part in @('EXCEPTION_ACCESS_VIOLATION','ErrorHandlerTest=14','fastdebug',$Revision)) {
        Assert-True ($Log.Contains($part)) "Wrong fatal report identity: $part"
    }
    Assert-True ($Log.TrimEnd().EndsWith('END.')) 'Fatal report incomplete'
}

function New-ChildEnvironment([string]$JdkHome, [string]$Options, [bool]$Fatal,
                              [string]$WindowsRoot=$env:SystemRoot) {
    $envCopy=[Collections.Generic.SortedDictionary[string,string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($entry in [Environment]::GetEnvironmentVariables().GetEnumerator()) {
        if ($entry.Key -notin @('JAVA_TOOL_OPTIONS','_JAVA_OPTIONS','JDK_JAVA_OPTIONS','JDK_AOT_VM_OPTIONS','GITHUB_TOKEN','GH_TOKEN')) {
            $envCopy[$entry.Key]=[string]$entry.Value
        }
    }
    $paths=@([IO.Path]::Combine($JdkHome,'bin'),[IO.Path]::Combine($WindowsRoot,'System32'),$WindowsRoot)
    if ($Fatal) {$paths=@([IO.Path]::Combine($JdkHome,'bin','server'))+$paths}
    $envCopy['PATH']=$paths -join ';'
    $envCopy['JAVA_TOOL_OPTIONS']=$Options
    return (($envCopy.GetEnumerator() | ForEach-Object { $_.Key+'='+$_.Value }) -join "`0")+"`0"
}

[Pr45Native]::Validate()
if ($ValidateOnly) {
    Assert-Imports "USER32.dll`n  123 CharNextExA" $true
    $rejected=$false
    try { Assert-Imports "USER32.dll`n  123 MessageBoxA`n  124 CharNextExA" $true } catch { $rejected=$true }
    Assert-True $rejected 'Import validator accepted GUI symbol'
    $fixture=[pscustomobject]@{error=$null;exit_code=1;killed=$false;cleanup_complete=$true;output='Unexpected Error';prompt_count=0;sent_n=$false}
    Assert-Fatal $fixture "EXCEPTION_ACCESS_VIOLATION ErrorHandlerTest=14 fastdebug rev`nEND." $false 'rev'
    $rejected=$false
    try { Assert-Fatal $fixture 'wrong' $false 'rev' } catch { $rejected=$true }
    Assert-True $rejected 'Fatal validator accepted wrong report'
    $fixture.output='Unexpected Error Enter y or N:';$fixture.prompt_count=1;$fixture.sent_n=$true
    Assert-Fatal $fixture "EXCEPTION_ACCESS_VIOLATION ErrorHandlerTest=14 fastdebug rev`nEND." $true 'rev'
    $fixture.sent_n=$false;$rejected=$false
    try { Assert-Fatal $fixture "EXCEPTION_ACCESS_VIOLATION ErrorHandlerTest=14 fastdebug rev`nEND." $true 'rev' } catch {$rejected=$true}
    Assert-True $rejected 'Fatal validator accepted missing console response'
    $before=[Environment]::GetEnvironmentVariable('JAVA_TOOL_OPTIONS')
    $block=New-ChildEnvironment '/fixture/jdk' '-XX:-CreateCoredumpOnCrash' $true '/fixture/windows'
    Assert-True ($block.Contains("JAVA_TOOL_OPTIONS=-XX:-CreateCoredumpOnCrash`0")) 'Wrong child options'
    Assert-True ($block.Contains('/fixture/jdk/bin/server')) 'Missing fatal child DLL path'
    Assert-True (!$block.Contains("_JAVA_OPTIONS=") -and !$block.Contains("JDK_JAVA_OPTIONS=")) 'Ambient options leaked'
    Assert-True ($before -eq [Environment]::GetEnvironmentVariable('JAVA_TOOL_OPTIONS')) 'Parent options mutated'
    Write-Output 'PASS: C# compilation, x64 layouts, quoting, prompt/import/fatal fixtures; no native child started'
    exit 0
}
Assert-True $IsWindows 'Native execution requires Windows'
$Evidence=[IO.Path]::GetFullPath($Evidence)
$identity=Get-Content -Raw (Join-Path $Evidence 'identity.json') | ConvertFrom-Json
$revision=$identity.manifest.build_commit
$results=[Collections.Generic.List[object]]::new()
$audits=[Collections.Generic.List[object]]::new()
$vswhere=Join-Path ${env:ProgramFiles(x86)} 'Microsoft Visual Studio/Installer/vswhere.exe'
$vs= & $vswhere -latest -products '*' -property installationPath
Assert-True ($LASTEXITCODE -eq 0 -and ![string]::IsNullOrEmpty($vs)) 'Installed Visual Studio not found'
$dumpbin=Get-ChildItem (Join-Path $vs 'VC/Tools/MSVC/*/bin/Hostx64/x64/dumpbin.exe') | Sort-Object FullName -Descending | Select-Object -First 1
Assert-True ($null -ne $dumpbin) 'Installed x64 dumpbin not found'

# dumpbin is a bounded inspection tool, not a target-image process.
foreach ($variant in @('release','fastdebug')) {
    $image=$identity.images.$variant
    foreach ($name in @('bin/jli.dll','bin/server/jvm.dll')) {
        $path=Join-Path $image.home $name
        $id=$variant+'-'+[IO.Path]::GetFileNameWithoutExtension($name)
        $info=[Diagnostics.ProcessStartInfo]::new($dumpbin.FullName)
        $info.ArgumentList.Add('/imports');$info.ArgumentList.Add($path)
        $info.UseShellExecute=$false;$info.RedirectStandardOutput=$true;$info.RedirectStandardError=$true
        $proc=[Diagnostics.Process]::Start($info)
        $out=$proc.StandardOutput.ReadToEndAsync();$err=$proc.StandardError.ReadToEndAsync()
        if (!$proc.WaitForExit(30000)) {$proc.Kill($true);$null=$proc.WaitForExit(5000);throw 'dumpbin deadline expired'}
        Assert-True ([Threading.Tasks.Task]::WaitAll([Threading.Tasks.Task[]]@($out,$err),5000)) 'dumpbin output cleanup deadline'
        $text=$out.Result+"`n"+$err.Result
        [IO.File]::WriteAllText((Join-Path $Evidence ($id+'-imports.txt')),$text)
        $failure=$null
        try { Assert-True ($proc.ExitCode -eq 0) 'dumpbin failed';Assert-Imports $text ($name -eq 'bin/jli.dll') } catch {$failure=$_.Exception.Message}
        $audits.Add([pscustomobject]@{file=$path;sha256=(Get-FileHash $path -Algorithm SHA256).Hash;pid=$proc.Id;exit_code=$proc.ExitCode;error=$failure})
        $proc.Dispose()
    }
}
$audits | ConvertTo-Json -Depth 8 | Set-Content (Join-Path $Evidence 'imports.json')

foreach ($variant in @('release','fastdebug')) {
    $image=$identity.images.$variant
    $case=$variant+'-jli';$directory=Join-Path $Evidence $case
    $null=New-Item -ItemType Directory -Path $directory
    $options='-XX:-CreateCoredumpOnCrash'
    $result=[Pr45Native]::Run($image.jli,@('--version'),(New-ChildEnvironment $image.home $options $false),$directory,$false)
    $failure=$result.error
    if ($null -eq $result.exit_code -or $result.exit_code -ne 0 -or !$result.cleanup_complete -or
        !$result.output.Contains($revision) -or ($result.output.Contains('fastdebug') -ne ($variant -eq 'fastdebug'))) {
        $failure='JLI exit/version/debug identity or cleanup mismatch: '+$failure
    }
    $results.Add([pscustomobject]@{case=$case;argv=@($image.jli,'--version');java_tool_options=$options;process=$result;error=$failure})
    $results | ConvertTo-Json -Depth 8 | Set-Content (Join-Path $Evidence 'results.json')
    if (!$result.cleanup_complete) {throw 'JLI controller cleanup incomplete; do not launch another child'}
}

$image=$identity.images.fastdebug
foreach ($console in @($false,$true)) {
    $case=if ($console) {'fatal-console'} else {'fatal-no-console'}
    $directory=Join-Path $Evidence $case;$null=New-Item -ItemType Directory -Path $directory
    $log=Join-Path $directory 'hs_err.log'
    $options='-XX:ErrorHandlerTest=14 -XX:+ShowMessageBoxOnError -XX:-CreateCoredumpOnCrash -XX:ErrorFile="'+$log+'"'
    $result=[Pr45Native]::Run($image.daemon,@('-Djava.class.path=.'),(New-ChildEnvironment $image.home $options $true),$directory,$console)
    $failure=$null
    try {
        Assert-True (Test-Path -LiteralPath $log) 'Fresh fatal report missing'
        Assert-Fatal $result (Get-Content -Raw -LiteralPath $log) $console $revision
    } catch {$failure=$_.Exception.Message+'; '+$result.error}
    $results.Add([pscustomobject]@{case=$case;argv=@($image.daemon,'-Djava.class.path=.');java_tool_options=$options;process=$result;error=$failure})
    $results | ConvertTo-Json -Depth 8 | Set-Content (Join-Path $Evidence 'results.json')
    if (!$result.cleanup_complete) {throw 'Fatal controller cleanup incomplete; do not launch another child'}
}
foreach ($record in $results) {
    [pscustomobject]@{case=$record.case;pid=$record.process.pid;exit_code=$record.process.exit_code;
        prompts=$record.process.prompt_count;sent_n=$record.process.sent_n;
        cleanup=$record.process.cleanup_complete;error=$record.error} | ConvertTo-Json -Compress | Write-Host
}
foreach ($audit in $audits) {
    [pscustomobject]@{file=$audit.file;sha256=$audit.sha256;error=$audit.error} | ConvertTo-Json -Compress | Write-Host
}
$dumps=@(Get-ChildItem $Evidence -Recurse -File | Where-Object {$_.Name -match '(^core($|\.)|\.dmp$|\.mdmp$)'})
Assert-True ($dumps.Count -eq 0) 'Unexpected core/minidump'
Assert-True ($results.Count -eq 4 -and $audits.Count -eq 4) 'Wrong process/import audit count'
Assert-True (@($results | Where-Object {![string]::IsNullOrEmpty($_.error)}).Count -eq 0) 'Windows native validation failed; see evidence'
Assert-True (@($audits | Where-Object {![string]::IsNullOrEmpty($_.error)}).Count -eq 0) 'Windows direct import audit failed; see evidence'
Write-Output 'PASS: four Windows target-image processes and four direct DLL import audits'
