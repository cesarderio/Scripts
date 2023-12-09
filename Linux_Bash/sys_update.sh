#!/bin/bash

# Script Name:                  VBox_Install
# Author:                       Raphael Chookagian
# Date of latest revision:      12/08/2023
# Purpose:                      Script runs update, upgrade, autoremove

# Update package lists
sudo apt update

# Upgrade installed packages
sudo apt upgrade

# Remove unnecessary packages
sudo apt autoremove -y



