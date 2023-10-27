# Check if GitHub Desktop is running and terminate it if it is
$desktopProcess = Get-Process -name "GitHubDesktop" -ErrorAction SilentlyContinue
if ($desktopProcess -ne $null) {
    Write-Host "Terminating GitHub Desktop..."
    Stop-Process -Name "GitHubDesktop" -Force
    Start-Sleep -Seconds 3
}

# Define the paths to the folders
$folder1Path = "$env:APPDATA\GitHub Desktop"
$folder2Path = "$folder1Path Other"
$folderTempPath = "$folder1Path Temp"

# Check if the source folders exist and the temporary folder doesn't exist
if ((Test-Path $folder1Path) -And (Test-Path $folder2Path) -And !(Test-Path $folderTempPath)) {
    # Rename the first folder to "Github Desktop Temp"
    Rename-Item -Path $folder1Path -NewName "Github Desktop Temp"

    # Rename the second folder to "Github Desktop"
    Rename-Item -Path $folder2Path -NewName "Github Desktop"

    # Rename the "Github Desktop Temp" folder back to "Github Desktop Other"
    Rename-Item -Path $folderTempPath -NewName "Github Desktop Other"

    Write-Host "Switched GitHub Desktop Accounts."

    # Start GitHub Desktop again
    Start-Process -FilePath "$env:LOCALAPPDATA\GitHubDesktop\GitHubDesktop.exe"
} else {
    Write-Host "One or more of the folders do not exist, or the temporary folder already exists. Please check the paths and folder names."
}

# Pause for 5 seconds before closing the window
Start-Sleep -Seconds 3
