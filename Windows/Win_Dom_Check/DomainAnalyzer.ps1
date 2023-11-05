# Script Name:                  Domain Analyzer
# Author:                       Raphael Chookagian
# Date of latest revision:      05/10/2023
# Purpose:                      Check for required tools and ask user to install if they're not found.
# Must be run as asministrator. 
# Allow script execution: 
# Set-ExecutionPolicy RemoteSigned

# File to output the results
$outputFile = "fetchDom.txt"

function ToolExists([string]$toolName) {
    return (Get-Command $toolName -ErrorAction SilentlyContinue) -ne $null
}

function CheckAndPromptForTool([string]$toolName) {
    if (-not (ToolExists $toolName)) {
        Write-Warning "Tool $toolName not found. Please install it before proceeding."
        Read-Host "Press Enter after installing $toolName..."
        if (-not (ToolExists $toolName)) {
            Write-Error "Tool $toolName is still not found. Exiting..."
            exit 1
        }
    }
}

# Functions
function WhoDis([string]$domain) {
    $result = whois $domain
    $result
    Add-Content -Path $outputFile -Value $result
}

function DigDis([string]$domain) {
    $result = dig $domain
    $result
    Add-Content -Path $outputFile -Value $result
}

function HostDis([string]$domain) {
    $result = host $domain
    $result
    Add-Content -Path $outputFile -Value $result
}

function NslDis([string]$domain) {
    $result = nslookup $domain
    $result
    Add-Content -Path $outputFile -Value $result
}

# Main
# Check for required tools
CheckAndPromptForTool "whois"
CheckAndPromptForTool "dig"
CheckAndPromptForTool "host"
CheckAndPromptForTool "nslookup"

# Remove the output file if it exists
if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

$userInput = Read-Host -Prompt "Please enter a domain name"
WhoDis $userInput
DigDis $userInput
HostDis $userInput
NslDis $userInput

# Open the output file using the default text editor
Invoke-Item $outputFile
