# Nmap Tutorial for Beginners

## Introduction

Nmap (Network Mapper) is an open-source tool for network exploration and security auditing. It was designed to rapidly scan large networks, although it works fine against single hosts.

## What is Nmap?

### Overview

Nmap uses raw IP packets to determine available hosts on the network, their services along with details, operating systems in use, packet filters/firewalls in use, and numerous other characteristics.

## Getting Started with Nmap

### Installation

- **Linux**: Most Linux distributions include Nmap in their repositories. Install using the package manager, e.g., `sudo apt-get install nmap` for Debian/Ubuntu.
- **Windows**: Download the executable from [Nmap's official website](https://nmap.org/download.html).
- **macOS**: Use Homebrew: `brew install nmap` or download from the website.

### Basic Nmap Commands

#### Scanning a Single Host

- `nmap [host]`
  - Example: `nmap 192.168.1.1`

#### Scanning Multiple Hosts

- Range: `nmap 192.168.1.1-20`
- List: `nmap 192.168.1.1,2,3`

#### Scanning a Network

- `nmap 192.168.1.0/24`

#### Port Scanning

- Specific ports: `nmap -p 80,443 192.168.1.1`
- Port ranges: `nmap -p 1-100 192.168.1.1`

#### Scan Types

- TCP Connect Scan: `nmap -sT 192.168.1.1`
- SYN Scan (Stealth Scan): `nmap -sS 192.168.1.1`
- UDP Scan: `nmap -sU -p 123,161,162 192.168.1.1`

### Advanced Scanning Techniques

#### OS Detection

- `nmap -O 192.168.1.1`

#### Service Version Detection

- `nmap -sV 192.168.1.1`

#### Aggressive Scan

- Combines OS detection, version detection, script scanning, and traceroute: `nmap -A 192.168.1.1`

#### Using Nmap Scripting Engine (NSE)

- `nmap --script=[script] [target]`
  - Example: `nmap --script=vuln 192.168.1.1`

## Best Practices and Tips

- **Legal Compliance**: Always have permission to scan the network.
- **Bandwidth and Performance**: Be aware of the network load Nmap can cause.
- **Stay Updated**: Nmap is regularly updated with new features and bug fixes.

## Conclusion

Nmap is an incredibly powerful tool for network administrators and security professionals. It offers a wide range of capabilities from simple network scanning to complex security auditing.

## Further Learning

- **Official Nmap Documentation**: Dive deeper into Nmap's capabilities by reading the official [Nmap documentation](https://nmap.org/docs.html).
- **Online Courses and Tutorials**: Look for online resources and tutorials to get hands-on experience with Nmap.
