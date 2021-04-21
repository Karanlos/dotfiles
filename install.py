import os
import errno
from pathlib import Path

home_path = str(Path.home())
path = home_path + '/.config/'
current_path = os.path.realpath('./nvim/')
if os.name == 'nt':
    print("Windows")
    path = os.getenv('LOCALAPPDATA') + "/"

try:
    os.makedirs(path, exist_ok=True)

except OSError as error:
    print('Creation of the directories failed. ' + str(error))
else:
    print('Creation of directories was successful')

try:
    if os.path.islink(path + 'nvim/'):
        print('Removing existing symlink')
        os.remove(path + 'nvim/')

    print('Current_path: %s,   path: %s' %(current_path, path))
    os.symlink(current_path, path + 'nvim')
    print(current_path)
    print(path + 'nvim/')
except OSError as error:
    print('Symlink failed: %s' % str(error))
else:
    print('Symlink created successfully.')
