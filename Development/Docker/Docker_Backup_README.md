# Docker Backup Script

<br>

## Introduction

This README accompanies the Docker Backup Script. This script automates the process of backing up Docker images, volumes, and `docker-compose.yml` files.

<br>

## Prerequisites

- Docker installed and running on your system.
- Basic knowledge of Docker and command line operations.
- Sufficient storage space in the backup location.

<br>

## Usage

1. **Download the Script**:

   Download the `docker_backup.sh` script to your local system.

2. **Make the Script Executable**:

   ```bash
   chmod +x docker_backup.sh
   ```

3. **Run the Script**:

   ```bash
   ./docker_backup.sh
   ```

   Follow the prompts to specify the backup directory.

4. **Backup Completion**:
   The script will save Docker images as `.tar` files, Docker volumes as `.tar` files, and copy `docker-compose.yml` files to the specified backup directory.

<br>

## Notes

- Ensure the specified backup directory has enough space to store the backups.
- Run the script with sufficient permissions to access Docker and the backup location.
- The script must be run on the host where the Docker containers are running.
