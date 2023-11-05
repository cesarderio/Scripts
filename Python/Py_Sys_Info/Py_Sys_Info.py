#!/usr/bin/env python3

# Script Name:                  Python System Information Script
# Author:                       Raphael Chookagian
# Date of latest revision:      10/05/2023
# Purpose:                      The 




import subprocess

def run_command(command):
    """Run a shell command and return its output."""
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, shell=True)
    return result.stdout

def Name():
    print("Name:")
    print(run_command("hostname"))

def CPU():
    print("CPU:")
    cpu_info = run_command("sudo lshw -class cpu")
    for line in cpu_info.split('\n'):
        if not any(x in line for x in ["capabilities", "version", "*-cpu"]):
            print(line)

def RAM():
    print("RAM:")
    memory_info = run_command("sudo lshw -class memory | grep -A 3 'memory'")
    print(memory_info)

def Display():
    print("Display Adapter:")
    display_info = run_command("sudo lshw -class display")
    for line in display_info.split('\n'):
        if not any(x in line for x in ["display", "version", "logical"]):
            print(line)

def Network():
    print("Network Adapter:")
    network_info = run_command("sudo lshw -class network")
    for line in network_info.split('\n'):
        if "network" not in line:
            print(line)

def DisplaySystemInfo():
    Name()
    CPU()
    RAM()
    Display()
    Network()

if __name__ == "__main__":
    DisplaySystemInfo()
