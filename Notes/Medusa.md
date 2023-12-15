# Medusa Password Cracker

This tutorial covers the installation and basic usage of Medusa on Kali Linux. Medusa is a command-line tool used for brute-force password cracking. It supports numerous protocols and services.

## Prerequisites

- Kali Linux operating system (Medusa is often pre-installed on Kali Linux, but this guide will also cover manual installation).

## Installation

### Step 1: Update System Repositories

Before installing, update your system's package list:

```bash
sudo apt-get update
```

### Step 2: Install Medusa

Install Medusa using the package manager:

```bash
sudo apt-get install medusa
```

## Basic Usage

Medusa works by attempting to connect to a service using a predefined list of usernames and passwords to find valid credentials.

### Syntax

The basic syntax for Medusa is:

```bash
medusa -h [hostname] -u [username] -p [password] -M [module]
```

Replace `[hostname]`, `[username]`, `[password]`, and `[module]` with the target's details and the service you are attacking.

### Example

To attempt a brute-force SSH login:

```bash
medusa -h 192.168.1.101 -u root -p password123 -M ssh
```

This command attempts to log into the SSH server at `192.168.1.101` as root with the password `password123`.

## Modules

Medusa supports various modules for different protocols and services, such as FTP, HTTP, SMB, SQL, SSH, and more.

To list all available modules:

```bash
medusa -d
```

## Warning

Use Medusa responsibly and legally. Unauthorized access to systems and networks is illegal. Medusa should be used for authorized penetration testing and security assessment activities only.

## Conclusion

Medusa is a powerful tool in the arsenal of penetration testers and security professionals for performing brute-force attacks. Its effectiveness in finding weak credentials makes it valuable for security auditing and testing.

For more advanced features and detailed usage, refer to the Medusa documentation and help command:

```bash
medusa -h
```
