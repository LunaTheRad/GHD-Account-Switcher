@echo off

set "sourceBat=%~dp0GHDAccountSwitcher.bat"
set "destBat=%APPDATA%\GHDAccountSwitcher\GHDAccountSwitcher.bat"
set "shortcutName=GHD Account Switcher.lnk"
set "desktopPath=%USERPROFILE%\Desktop"

:: Create the GHDAccountSwitcher folder if it doesn't exist
if not exist "%APPDATA%\GHDAccountSwitcher" (
    mkdir "%APPDATA%\GHDAccountSwitcher"
)

:: Copy GHDAccountSwitcher.bat to the destination
copy "%sourceBat%" "%destBat%" /Y

:: Copy the GHD Account Switcher shortcut to the desktop
copy "%shortcutName%" "%desktopPath%\%shortcutName%" /Y

echo GHDAccountSwitcher.bat has been copied to "%APPDATA%\GHDAccountSwitcher\GHDAccountSwitcher.bat"
echo GHD Account Switcher shortcut has been copied to the desktop.

timeout /t 10
