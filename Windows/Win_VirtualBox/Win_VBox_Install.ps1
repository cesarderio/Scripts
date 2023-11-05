# VBox_Install.ps1

# Author: Raphael Chookagian
# Date of latest revision: 10/05/2023
# Purpose: Script installs VirtualBox on a Windows system using Chocolatey.

# Check if Chocolatey is installed, install if not
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
  Write-Host "Chocolatey is not installed. Installing Chocolatey..."
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((Invoke-WebRequest -UseBasicParsing -Uri 'https://chocolatey.org/install.ps1').Content)
  if ($LASTEXITCODE -ne 0) {
      Write-Error "Error encountered while installing Chocolatey. Exiting."
      Exit
  }
}

# Install VirtualBox
Write-Host "Installing VirtualBox..."
choco install virtualbox -y
if ($LASTEXITCODE -ne 0) {
  Write-Error "Error encountered while installing VirtualBox. Exiting."
  Exit
}

# Download and install the VirtualBox extension pack
Write-Host "Installing VirtualBox Extension Pack..."
$extensionPackURL = "https://download.virtualbox.org/virtualbox/6.1.38/Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack"
Invoke-WebRequest -Uri $extensionPackURL -OutFile "Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack"
Start-Process -FilePath "VBoxManage.exe" -ArgumentList "extpack install Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack" -Wait

# Cleanup - remove the downloaded extension pack
Remove-Item "Oracle_VM_VirtualBox_Extension_Pack-6.1.38.vbox-extpack"

Write-Host "Installation completed!"
