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
        files = ['.vimrc', '.tmux.conf', 'config', '.zshrc']
        home = Path(os.path.expanduser('~'))
        for f in files:
            if f == 'config':
                home_path = str(home / '.ssh/config')
            else:
                home_path = str(home / f)
            local_path = str(Path() / f)
            if cmd == 'pull':
                shutil.copy(home_path, local_path)
                print("copy {} to {}".format(home_path, local_path))
            elif cmd == 'push':
                shutil.copy(local_path, home_path)
                print("copy {} to {}".format(local_path, home_path))
