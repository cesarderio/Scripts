#!/usr/bin/python3

# Script Name:                  
# Author:                       Raphael Chookagian
# Date of latest revision:      09/20/2023
# Purpose:                      Write a script that:

import nmap
import subprocess
import threading
import os
import json

scanner = nmap.PortScanner()

def scan_target(ip_addr, resp, range):
    results = {}
    if resp == '1':
        scanner.scan(ip_addr, range, '-v -sS')
    elif resp == '2':
        scanner.scan(ip_addr, range, '-v -sU')
    elif resp == '3':
        scanner.scan(ip_addr, range, '-v -sS -sV -sC -A -O')
    else:
        print("Please enter a valid option")
        return

    results[ip_addr] = scanner[ip_addr]

    # Check for specific services and run corresponding tools
    for protocol in scanner[ip_addr].all_protocols():
        for port in scanner[ip_addr][protocol].keys():
            service = scanner[ip_addr][protocol][port]['name']
            if service == 'http':
                # Run nikto and gobuster for http
                print(f"\nRunning nikto on {ip_addr}:{port}")
                subprocess.run(['nikto', '-h', f"{ip_addr}:{port}"])
                print(f"\nRunning gobuster on {ip_addr}:{port}")
                subprocess.run(['gobuster', 'dir', '-u', f"http://{ip_addr}:{port}", '-w', wordlist_path])
            elif service == 'netbios-ssn' or service == 'microsoft-ds':
                # Run enum4linux for SMB
                print(f"\nRunning enum4linux on {ip_addr}")
                subprocess.run(['enum4linux', ip_addr])

    with open(f"scan_results_{ip_addr}.json", 'w') as f:
        json.dump(results, f)

print("Nmap Automation Tool")
print("--------------------")

ip_addr = input("IP address or subnet to scan (e.g. 192.168.1.0/24): ")

# Ask for wordlist or search for it
wordlist_choice = input("Do you have a wordlist path? (yes/no): ")
if wordlist_choice.lower() == 'yes':
    wordlist_path = input("Enter the path to your wordlist: ")
else:
    search_dir = input("Enter directory to search for wordlists (e.g. /usr/share/): ")
    wordlists = []
    for root, dirs, files in os.walk(search_dir):
        for file in files:
            if 'wordlist' in file or 'dictionary' in file:
                wordlists.append(os.path.join(root, file))
    for idx, wordlist in enumerate(wordlists, 1):
        print(f"{idx}. {wordlist}")
    selected_wordlist = int(input("Select a wordlist by number: "))
    wordlist_path = wordlists[selected_wordlist - 1]

# If a subnet is provided, list all live hosts
if '/' in ip_addr:
    scanner.scan(hosts=ip_addr, arguments='-sn')
    live_hosts = [host for host in scanner.all_hosts() if scanner[host].state() == 'up']
    print("\nLive hosts detected:")
    for index, host in enumerate(live_hosts, start=1):
        print(f"{index}. {host}")
    selected = input("\nSelect IP(s) to target (e.g. 1,3,4): ").split(',')
    targets = [live_hosts[int(choice)-1] for choice in selected]
else:
    targets = [ip_addr]

threads = []
for ip_addr in targets:
    print(f"\nScanning {ip_addr}...")
    resp = input("""\nSelect scan to execute:
                    1) SYN ACK Scan
                    2) UDP Scan
                    3) Comprehensive Scan\n""")
    range = input("Enter the port range to scan (e.g. 1-50): ")

    t = threading.Thread(target=scan_target, args=(ip_addr, resp, range))
    threads.append(t)
    t.start()

for t in threads:
    t.join()

print("\nScanning completed! Check the JSON files for detailed results.")
