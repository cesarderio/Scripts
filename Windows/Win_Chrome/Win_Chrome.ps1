# Script Name:                  Chrome Initialization
# Author:                       Raphael Chookagian
# Date of latest revision:      05/21/2023
# Purpose:                      Install Google Chrome and set it as default browser on Windows machines.

# Function to check the last command's status
function Check-Status {
  if (-not $?) {
      Write-Error "Error encountered. Exiting."
      exit 1
  }
}

# Check if Chrome is already installed
if (-not (Test-Path "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")) {
  # Download and install Google Chrome
  $chromeUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
  $downloadPath = "$env:TEMP\chrome_installer.exe"
  Invoke-WebRequest -Uri $chromeUrl -OutFile $downloadPath
  Check-Status
  
  Start-Process -Wait -FilePath $downloadPath
  Check-Status

  Remove-Item $downloadPath
} else {
  Write-Host "Google Chrome is already installed."
}

# Set Google Chrome as default browser (requires admin privileges and might not work on newer versions of Windows due to Microsoft's policies)
# Chrome may have to be set as the default browser manually.
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" -Name "ProgId" -Value "ChromeHTML"
Check-Status
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" -Name "ProgId" -Value "ChromeHTML"
Check-Status

Write-Host "Google Chrome has been installed and set as the default browser."

# End
