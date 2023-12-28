# README: Docker Restore Script

<br>

## Introduction

This README accompanies the Docker Restore Script. This script facilitates the restoration and redeployment of Docker containers from backups, including Docker images, volumes, and configurations.

<br>

## Prerequisites

- Docker installed and running on the target system.
- Python 3.x installed.
- Backup files created by the Docker Backup Script.

<br>

## Usage

1. **Download the Script**:
   Download the `docker_restore.py` script to your local system.

2. **Run the Python Script**:

   ```bash
   python3 docker_restore.py
   ```

   Follow the prompts to specify the directories for Docker images, volumes, and `docker-compose.yml` files.

3. **Restoration Process**:
   The script will load Docker images from the specified directory, restore Docker volumes, and redeploy containers using `docker-compose`.

<br>

## Notes

- Ensure Docker and Python are correctly installed and configured on the system where you intend to restore the containers.
- Verify that the paths provided to the script correctly point to your backup files.
- It's recommended to test the restoration process in a controlled environment before applying it to a production system.
