#!/usr/bin/python3

import os, errno
from pathlib import Path

home_path = str(Path.home())
path = home_path + '/.config/'
current_path = os.path.realpath('./nvim')

def symlink():
    for root, dirs, files in os.walk(os.path.realpath('./nvim')):
        for name in files:
            target = os.path.relpath(os.path.join(root, name))
            link_name = os.path.relpath(os.path.join(path, name))

#            try:
#                os.symlink(target, link_name)
#            except OSError as error:
#                if error.errno == errno.EEXIST:
#                    os.remove(link_name)
#                    os.symlink(target, link_name)

            print(root)
            print(target)
            print(link_name)
            print(path)

try:
    os.makedirs(path + 'nvim/lua/utils', exist_ok=True)
    os.makedirs(path + 'nvim/lua/plugins', exist_ok=True)
    symlink()
except OSError as error:
    print('Creation of the directories failed. ' + str(error))
else:
    print('Creation of directories was successful')

