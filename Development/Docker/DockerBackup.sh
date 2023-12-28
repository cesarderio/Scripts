#!/bin/bash

# Script Name:                  Backup Docker Container
# Author:                       Raphael Chookagian
# Date of latest revision:      12/27/2023
# Purpose:                      Save all Docker images to a directory. Backup all Docker volumes. Save the docker-compose.yml files if present.


# Ask user for backup directory
read -p "Enter the directory where you want to store the backups: " BACKUP_DIR

# Define directories for backup
IMAGE_DIR="${BACKUP_DIR}/images"
VOLUME_DIR="${BACKUP_DIR}/volumes"

# Create directories if they don't exist
mkdir -p "${IMAGE_DIR}"
mkdir -p "${VOLUME_DIR}"

# Function to save Docker images
save_docker_images() {
    echo "Saving Docker images..."
    docker images --format "{{.Repository}}:{{.Tag}}" | while read -r image; do
        image_name=$(echo "${image}" | tr "/" "_" | tr ":" "_")
        docker save -o "${IMAGE_DIR}/${image_name}.tar" "${image}"
    done
}

# Function to backup Docker volumes
backup_docker_volumes() {
    echo "Backing up Docker volumes..."
    docker volume ls -q | while read -r volume; do
        docker run --rm -v "${volume}:/volume" -v "${VOLUME_DIR}:/backup" alpine tar cvf "/backup/${volume}.tar" -C /volume ./
    done
}

# Save Docker images
save_docker_images

# Backup Docker volumes
backup_docker_volumes

# Copy docker-compose files if any
find / -name docker-compose.yml -exec cp {} "${BACKUP_DIR}" \;

echo "Backup completed."


