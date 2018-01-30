import os, sys
from pathlib import Path
import shutil

def help():
    print("python3 sync.py [cmd]")
    print()
    print("cmd : [push | pull]")

if __name__ == '__main__':
    if len(sys.argv) < 2 or sys.argv[1] not in ['push', 'pull']:
        help()
    else:
        cmd = sys.argv[1]
        files = ['.vimrc', '.tmux.conf']
        home = Path(os.path.expanduser('~'))
        if cmd == 'pull':
            for f in files:
                shutil.copy(str(home / f), str(Path() / f))
        elif cmd == 'push':
            for f in files:
                shutil.copy(str(Path() / f), str(home / f))
