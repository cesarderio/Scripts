# Script Name:                  GitHub
# Author:                       Raphael Chookagian
# Date of latest revision:      10/05/2023
# Purpose:                      This is a powershell script translation of the Ubuntu/Git_Config.sh script for configuring Git on Windows systems.


# Check if git is installed
function Test-GitInstalled {
  try {
      $version = git --version
      return $true
  } catch {
      return $false
  }
}

# Check if Chocolatey is installed
function Test-ChocolateyInstalled {
  try {
      $chocoVersion = choco --version
      return $true
  } catch {
      return $false
  }
}

# Install Chocolatey
function Install-Chocolatey {
  Set-ExecutionPolicy Bypass -Scope Process -Force;
  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
  iex ((Invoke-WebRequest -Uri https://chocolatey.org/install.ps1).Content)
}

# Install git using Chocolatey
function Install-Git {
  if (Test-ChocolateyInstalled) {
      choco install git -y
  } else {
      Write-Host "Chocolatey is not installed. Installing Chocolatey..."
      Install-Chocolatey
      choco install git -y
  }
}

# Download and install Git from its website
function Download-Git {
  Start-Process "https://git-scm.com/download/win"
  Write-Host "Follow the installation steps from the browser or downloaded executable to complete the Git installation."
}

# Configure git
function Configure-Git {
  $username = Read-Host "Enter your GitHub username"
  $email = Read-Host "Enter your GitHub email"

  git config --global user.name $username
  git config --global user.email $email
}

# Main function
function Main {
  if (Test-GitInstalled) {
      $choice = Read-Host "Git is already installed. Do you want to update/upgrade it using Chocolatey? (yes/no)"
      if ($choice -eq "yes") {
          if (Test-ChocolateyInstalled) {
              choco upgrade git -y
          } else {
              Write-Host "Chocolatey is not installed. Installing Chocolatey..."
              Install-Chocolatey
              choco upgrade git -y
          }
      }
  } else {
      $installMethod = Read-Host "Git is not installed. Choose an installation method: (1) Chocolatey, (2) Direct Download"
      if ($installMethod -eq "1") {
          Install-Git
      } elseif ($installMethod -eq "2") {
          Download-Git
      } else {
          Write-Host "Invalid choice. Exiting."
          return
      }
  }

  Configure-Git
  Write-Host "Git has been configured successfully!"
}

Main
