@echo off
call "C:\Program Files\Microsoft Visual Studio\18\Enterprise\vc\auxiliary\build\vcvars64.bat" -vcvars_ver=14.44
if errorlevel 1 exit /b %errorlevel%
"cl.exe" "/nologo" "/std:c11" "/O2" "/utf-8" "/c" "/FAs" "/FaD:\a\openjdk-jdk27u\openjdk-jdk27u\validation\msvc-baseline\SerialProbe.asm" "/FoD:\a\openjdk-jdk27u\openjdk-jdk27u\validation\msvc-baseline\SerialProbe.obj" "/ID:\a\openjdk-jdk27u\openjdk-jdk27u\src\java.base\share\native\libjava\stringzilla" "D:\a\openjdk-jdk27u\openjdk-jdk27u\validation\msvc-baseline\SerialProbe.c"
if errorlevel 1 exit /b %errorlevel%
"cl.exe" "/nologo" "D:\a\openjdk-jdk27u\openjdk-jdk27u\validation\msvc-baseline\SerialProbe.obj" "/FeD:\a\openjdk-jdk27u\openjdk-jdk27u\validation\msvc-baseline\SerialProbe.exe"
if errorlevel 1 exit /b %errorlevel%
