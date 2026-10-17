#!/usr/bin/env python3
# Copyright (c) 2026, Teamoffy Pte. Ltd. All rights reserved.
# SPDX-License-Identifier: GPL-2.0-only WITH Classpath-exception-2.0
"""Unexecuted qualification helper: one fixed wall budget, no retry."""
import argparse, json, os, signal, subprocess, threading, time
from pathlib import Path

def execute(command, log, deadline, timeout, cwd=None):
    # Reserve bounded cleanup time inside both the command and packet ceilings.
    left=min(deadline-time.monotonic(),timeout)-10
    if left<=0:raise TimeoutError('qualification deadline reached')
    log=Path(log);log.parent.mkdir(parents=True,exist_ok=True)
    if log.exists():raise RuntimeError('refusing to replace an existing command log: '+str(log))
    with log.open('w') as stream:
        stream.write(repr([str(x) for x in command])+'\n');stream.flush()
        options={'creationflags':subprocess.CREATE_NEW_PROCESS_GROUP} if os.name=='nt' else {'start_new_session':True}
        started=time.time();started_monotonic=time.monotonic();begin=time.perf_counter_ns()
        process=subprocess.Popen([str(x) for x in command],cwd=cwd,stdout=stream,stderr=subprocess.STDOUT,**options)
        done=threading.Event();completion={}
        def waiter():
            try:completion['status']=process.wait()
            except BaseException as error:completion['error']=repr(error)
            finally:completion['end_ns']=time.perf_counter_ns();done.set()
        threading.Thread(target=waiter,daemon=True).start()
        def cleanup():
            if os.name=='nt':
                result=subprocess.run(['taskkill','/PID',str(process.pid),'/T','/F'],stdout=stream,stderr=stream,check=False,timeout=5)
                # Tree certainty after an abnormal native Windows exit belongs to the job supervisor.
                if result.returncode:stream.write('\nCLEANUP_UNCERTAIN: Windows tree termination not confirmed\n')
            else:
                try:os.killpg(process.pid,signal.SIGKILL)
                except ProcessLookupError:pass
            if not done.wait(5):raise RuntimeError('CLEANUP_UNCERTAIN: '+str(log))
        old_term=None
        if threading.current_thread() is threading.main_thread():
            old_term=signal.getsignal(signal.SIGTERM)
            def interrupted(signum,frame):raise KeyboardInterrupt('qualification interrupted')
            signal.signal(signal.SIGTERM,interrupted)
        try:
            if not done.wait(left):raise TimeoutError('command deadline reached: '+str(log))
            if 'error' in completion:raise RuntimeError(completion['error'])
            status=completion['status']
            if status:raise RuntimeError('command exit '+str(status)+': '+str(log))
            if os.name!='nt':
                try:os.killpg(process.pid,0)
                except ProcessLookupError:pass
                else:raise RuntimeError('unexpected residual descendants: '+str(log))
        except BaseException as failure:
            stream.write('\nfailure='+repr(failure)+'\n');stream.flush()
            try:cleanup()
            except BaseException as error:
                stream.write('\nCLEANUP_UNCERTAIN: '+repr(error)+'\n');stream.flush()
                raise RuntimeError('cleanup uncertain; stop the entire native job: '+str(log)) from error
            stream.write('\nABNORMAL EXIT; no retry permitted\n');raise
        finally:
            if old_term is not None:signal.signal(signal.SIGTERM,old_term)
        wall=completion['end_ns']-begin
        stream.write('\nprocess_wall_ns='+str(wall)+'\n')
        Path(str(log)+'.receipt.json').write_text(json.dumps(dict(command=[str(x) for x in command],
            cwd=str(Path(cwd or os.getcwd()).resolve()),started=started,started_monotonic=started_monotonic,finished=time.time(),
            wall_ns=wall,exit_status=status,deadline=deadline),indent=2)+'\n')
        if time.monotonic()>deadline:raise TimeoutError('qualification deadline reached after '+str(log))
    stdout=log.read_text().split('\n',1)[1].rsplit('\nprocess_wall_ns=',1)[0]
    return dict(stdout=stdout,wall_ns=wall)

if __name__=='__main__':
    p=argparse.ArgumentParser()
    p.add_argument('--started',type=float,required=True)
    p.add_argument('--max-seconds',type=int,required=True,choices=[120,300,1800])
    p.add_argument('--log',type=Path,required=True);p.add_argument('--cwd',type=Path)
    p.add_argument('command',nargs=argparse.REMAINDER);a=p.parse_args()
    command=a.command[1:] if a.command[:1]==['--'] else a.command
    if not 0<=time.monotonic()-a.started<10800:raise SystemExit('invalid/expired monotonic packet start')
    execute(command,a.log,a.started+10800,a.max_seconds,a.cwd)
