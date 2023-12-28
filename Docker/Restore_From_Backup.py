#!/usr/bin/env python3


# Script Name:                  Restore docker containers from backup
# Author:                       Raphael Chookagian
# Date of latest revision:      12/27/2023
# Purpose:                      This python script gives a user the ability to:
  # Load Docker images from a backup directory.
  # Restore Docker volumes.
  # Use docker-compose to redeploy containers.

# Import Libraries

import os
import subprocess

# Define Functions

# define function to ask user for directory to restore from
def prompt_for_directory(description):
    return input(f"Enter the directory for {description}: ")

# define function to load docker images from backup
def load_docker_images(image_dir):
    for image_file in os.listdir(image_dir):
        if image_file.endswith(".tar"):
            print(f"Loading image {image_file}...")
            subprocess.run(["docker", "load", "-i", os.path.join(image_dir, image_file)])

# define function to restore docker volumes from backup
def restore_docker_volumes(volume_dir):
    for volume_file in os.listdir(volume_dir):
        if volume_file.endswith(".tar"):
            volume_name = volume_file[:-4]
            print(f"Restoring volume {volume_name}...")
            subprocess.run(["docker", "volume", "create", volume_name])
            subprocess.run(["docker", "run", "--rm", "-v", f"{volume_name}:/volume", "-v", f"{volume_dir}:/backup", "alpine", "sh", "-c", f"tar xvf /backup/{volume_file} -C /volume"])

# define function to redeploy docker containers from backup
def redeploy_containers(backup_dir):
    for root, dirs, files in os.walk(backup_dir):
        if "docker-compose.yml" in files:
            print(f"Redeploying containers in {root}...")
            subprocess.run(["docker-compose", "-f", os.path.join(root, "docker-compose.yml"), "up", "-d"])


# Main

def main():
    image_dir = prompt_for_directory("Docker images")
    volume_dir = prompt_for_directory("Docker volumes")
    backup_dir = prompt_for_directory("docker-compose files")

    load_docker_images(image_dir)
    restore_docker_volumes(volume_dir)
    redeploy_containers(backup_dir)

if __name__ == "__main__":
    main()

# End
