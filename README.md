# GHD Account Switcher
 A simple CMD script that allows you to switch between two github desktop accounts.
 
 The script allows you to switch between two accounts.
 The first time you run it you will be prompted if you want to add an account.
 After that it will switch to the one not currently in use.
 
# Using the script

## Setup

Running "setup.bat" will copy "GHDAccountSwitcher.bat" to its own folder in %APPDATA%,
as well as copying the shortcut to your desktop.
Run the script from the shortcut and press Y to add the second account.

## General

The script terminates GitHub Desktop if it's currently running
It then switches out the "GitHub Desktop" and "GitHub Desktop Other" folders in %APPDATA%.
Then, GitHub Desktop starts again, wich loads the switched account.