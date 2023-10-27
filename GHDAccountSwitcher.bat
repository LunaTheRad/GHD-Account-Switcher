@echo off
SETLOCAL EnableDelayedExpansion

:: Define the paths to the folders
set "folder1Path=%APPDATA%\GitHub Desktop"
set "folder2Path=%folder1Path% Other"
set "folderTempPath=%folder1Path% Temp"

:: Check if the "GitHub Desktop Other" folder exists
if not exist "%folder2Path%" (
    choice /m "No second GitHub Desktop account found. Do you wish to add an account "
	if !errorlevel!==1 (
        mkdir "%folder2Path%"
        echo Switched to empty account. Please note that you will need to sign in to a GitHub account when GitHub Desktop starts.
    ) else (
        echo You chose not to add a second account. Exiting...
        timeout /t 3
        goto :EOF
    )
)

:: Check if GitHub Desktop is running and terminate it if it is
tasklist /fi "imagename eq GitHubDesktop.exe" 2>nul | find /i /n "GitHubDesktop.exe" > nul
if %errorlevel%==0 (
    echo Terminating GitHub Desktop...
    taskkill /f /im GitHubDesktop.exe
    timeout /t 3
)

:: Continue with the folder renaming
if exist "%folder1Path%" if not exist "%folderTempPath%" (
    :: Rename the first folder to "GitHub Desktop Temp"
    rename "%folder1Path%" "GitHub Desktop Temp"

    :: Rename the "GitHub Desktop Other" folder to "GitHub Desktop"
    rename "%folder2Path%" "GitHub Desktop"

    :: Rename the "GitHub Desktop Temp" folder back to "GitHub Desktop Other"
    rename "%folderTempPath%" "GitHub Desktop Other"

    echo Switched GitHub Desktop Accounts.

    :: Start GitHub Desktop again
    start "" "%LOCALAPPDATA%\GitHubDesktop\GitHubDesktop.exe"
) else (
    echo One or more of the folders do not exist, or the temporary folder already exists. Please check the paths and folder names.
)

:: Pause for 3 seconds before closing the window
timeout /t 3
