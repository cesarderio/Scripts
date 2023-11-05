# Script Name:                  GitHub
# Author:                       Raphael Chookagian
# Date of latest revision:      10/05/2023
# Purpose:                      This is a powershell script translation of the Ubuntu_Init script for basic installs and settings, (SSH, RDP, VSCode, Chrome, VirtualBox, etc)
# Installation of needed tools may be required, i.e. (Chocolatey)
# Note: This script is a translation of Ubuntu_init and may not work as expected due to the differences between Linux and Windows systems.



# Function to check if a program is installed using Chocolatey
function Is-ChocoPackageInstalled {
  param (
      [string]$packageName
  )

  $chocoList = choco list --local-only
  return $chocoList -match "^$packageName\s"
}

# Function to install SSH
function Install-SSH {
  # Check if OpenSSH client and server are already installed
  $clientInstalled = (Get-WindowsCapability -Online | Where-Object Name -eq 'OpenSSH.Client').State -eq 'Installed'
  $serverInstalled = (Get-WindowsCapability -Online | Where-Object Name -eq 'OpenSSH.Server').State -eq 'Installed'

  if (-not $clientInstalled) {
      Add-WindowsCapability -Online -Name OpenSSH.Client
  }

  if (-not $serverInstalled) {
      Add-WindowsCapability -Online -Name OpenSSH.Server
      Start-Service sshd
  }
}

# Function to configure XRDP (RDP in Windows)
function Configure-RDP {
  # Enabling Remote Desktop
  Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
  Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
}

# Function to install VS Code
function Install-VSCode {
  if (-not (Is-ChocoPackageInstalled 'vscode')) {
      choco install vscode
  }
}

# Function to configure Git
function Configure-Git {
  if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
      if ((Read-Host "Git is not installed. Do you want to install it? (y/n)") -eq 'y') {
          choco install git
      }
  }

  $configure = Read-Host "Do you want to configure Git? (y/n)"
  if ($configure -eq "y") {
      $git_username = Read-Host "Enter your GitHub username"
      $git_email = Read-Host "Enter your GitHub email"
      git config --global user.name $git_username
      git config --global user.email $git_email
      Write-Host "Git has been configured with the provided username and email."
  }
}

# Function to install Google Chrome
function Install-Chrome {
  if (-not (Is-ChocoPackageInstalled 'googlechrome')) {
      if ((Read-Host "Google Chrome is not installed. Do you want to install it? (y/n)") -eq 'y') {
          choco install googlechrome
      }
  }
}

# Function to set Chrome as default browser
function Set-ChromeDefault {
  choco install setdefaultbrowser
  setdefaultbrowser chrome
}

# Function to install VirtualBox
function Install-VirtualBox {
  if (-not (Is-ChocoPackageInstalled 'virtualbox')) {
      if ((Read-Host "VirtualBox is not installed. Do you want to install it? (y/n)") -eq 'y') {
          choco install virtualbox
      }
  }
}

# Main function
function Main {
  Install-SSH
  Configure-RDP
  Install-VSCode
  Configure-Git
  Install-Chrome
  Set-ChromeDefault
  Install-VirtualBox
}

# Execute the main function
Main


# End
