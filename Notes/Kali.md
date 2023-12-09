# Basic Navigation and Commands in Kali Linux

## Introduction

Kali Linux is a powerful Linux distribution used for penetration testing, ethical hacking, and network security assessments. This tutorial provides a foundational understanding of how to navigate Kali Linux and use its most common applications.

## Getting Started with Kali Linux

### Installation

- Download Kali Linux from the official website.
- Burn the image to a USB drive or DVD.
- Boot from the USB/DVD and follow the installation instructions.

### Initial Setup

- Set your timezone, language, and keyboard preferences.
- Create a user account and password.

## Basic Navigation in Kali Linux

### Kali Interface

- Kali uses the GNOME desktop environment by default.
- The desktop consists of a top bar, a bottom panel, and desktop icons.

### Essential Commands

- `cd`: Change directory.
- `ls`: List files and directories.
- `pwd`: Print the working directory.
- `mkdir`: Create a new directory.

### File Management

- `cp`: Copy files and directories.
- `mv`: Move or rename files and directories.
- `rm`: Remove files and directories.

## Network Configuration in Kali

- Use `ifconfig` to configure network interfaces.
- Test connectivity using `ping`.
- View network connections with `netstat`.

## Package Management

### Using `apt`

- Update package lists: `sudo apt update`
- Upgrade packages: `sudo apt upgrade`
- Install a package: `sudo apt install [package_name]`

## System Monitoring and Management

### Monitoring Resources

- `top` or `htop`: Monitor real-time system performance.
- `free`: View memory usage.

### Managing Services

- Start a service: `sudo systemctl start [service_name]`
- Stop a service: `sudo systemctl stop [service_name]`
- Enable a service to start at boot: `sudo systemctl enable [service_name]`

## User and Group Management

- Create a new user: `sudo useradd [username]`
- Set or change a user's password: `sudo passwd [username]`
- Create a new group: `sudo groupadd [group_name]`
- Add a user to a group: `sudo usermod -aG [group_name] [username]`
- Change file permissions: `chmod [permissions] [file]`
- Change file ownership: `chown [user]:[group] [file]`

## Popular Tools and Applications in Kali Linux

### Nmap

- Basic scan: `nmap [target_IP]`
- Scan specific ports: `nmap -p [port_range] [target_IP]`

### Metasploit Framework

- Start Metasploit: `msfconsole`
- Basic commands: `search`, `use`, `set`, `exploit`

### Wireshark

- Launch Wireshark: `wireshark`
- Select a network interface to capture packets.
- Apply filters to analyze specific traffic.

### Burp Suite

- Start Burp Suite: `burpsuite`
- Configure your browser to use Burp as a proxy.
- Intercept and modify HTTP requests and responses.

### Aircrack-ng

- Monitor Wi-Fi networks: `airmon-ng start [interface_name]`
- Capture traffic: `airodump-ng [monitor_interface]`
- Crack Wi-Fi password: `aircrack-ng [capture_file]`

## Advanced Tips and Tricks

- Customize the look and feel of Kali through GNOME Tweaks.
- Use keyboard shortcuts like `Ctrl+Alt+T` for terminal.
