# Script Name:                  PowerShell System Information Script
# Author:                       Raphael Chookagian
# Date of latest revision:      10/05/2023
# Purpose:                      Gather and display system information on a Windows machine.

function Get-Name {
    Write-Output "Name:"
    [System.Net.Dns]::GetHostName()
}

function Get-CPU {
    Write-Output "CPU:"
    Get-WmiObject -Class Win32_Processor | ForEach-Object {
        $_.Name
    }
}

function Get-RAM {
    Write-Output "RAM:"
    $totalRam = Get-WmiObject -Class Win32_ComputerSystem | ForEach-Object {
        $_.TotalPhysicalMemory / 1GB
    }
    "$totalRam GB"
}

function Get-Display {
    Write-Output "Display Adapter:"
    Get-WmiObject -Class Win32_VideoController | ForEach-Object {
        $_.Name
    }
}

function Get-Network {
    Write-Output "Network Adapter:"
    Get-WmiObject -Class Win32_NetworkAdapter | Where-Object {
        $_.NetConnectionID
    } | ForEach-Object {
        $_.Name
    }
}

function Display-SystemInfo {
    Get-Name
    Get-CPU
    Get-RAM
    Get-Display
    Get-Network
}

Display-SystemInfo
