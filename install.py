#!/usr/bin/python3

import os, errno
from pathlib import Path

home_path = str(Path.home())
path = home_path + '/.config/'
current_path = os.path.realpath('./nvim')

try:
    os.makedirs(path, exist_ok=True)
    if os.path.islink(path + 'nvim'):
        print('Removing existing symlink')
        os.remove(path + 'nvim')

    os.symlink(current_path, path + 'nvim')
except OSError as error:
    print('Creation of the directories failed. ' + str(error))
else:
    print('Creation of directories was successful')

