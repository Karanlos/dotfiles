#!/usr/bin/python3

import os, errno
from pathlib import Path

home_path = str(Path.home()) 
path = home_path + '/.config/'

def symlink():
    for root, dirs, files in os.walk('./nvim'):
        for name in files:
            target = os.path.realpath(os.path.join(root, name))
            link_name = os.path.realpath(os.path.join(path, root + '/' + name))

            try:
                os.symlink(target, link_name)
            except OSError as error:
                if error.errno == errno.EEXIST:
                    os.remove(link_name)
                    os.symlink(target, link_name)

            print(target)
            print(link_name)

try:
    os.makedirs(path + 'nvim/lua/utils', exist_ok=True)
    os.makedirs(path + 'nvim/lua/plugins', exist_ok=True)
    symlink()
except OSError as error:
    print('Creation of the directories failed. ' + str(error))
else:
    print('Creation of directories was successful')

