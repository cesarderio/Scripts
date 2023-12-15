# CasaOS Setup Tutorial

This tutorial guides you through the installation and basic setup of CasaOS, a lightweight, Docker-based home cloud system. CasaOS provides an intuitive interface for managing Docker applications and personal data at home.

## Prerequisites

- A computer or Raspberry Pi to run CasaOS.
- Docker installed on your system. If not installed, refer to the [Docker installation guide](https://docs.docker.com/get-docker/).

## Installation

### Step 1: Install CasaOS

CasaOS offers an easy one-line installation script. Run the following command in your terminal:

```bash
curl -fsSL https://get.casaos.io -o get-casaos.sh && sh get-casaos.sh
```

This script will install CasaOS and necessary dependencies on your system.

### Step 2: Access CasaOS

Once installed, CasaOS can be accessed via a web browser:

```
http://<YOUR-SERVER-IP>:80
```

Replace `<YOUR-SERVER-IP>` with the IP address of the system where CasaOS is installed.

## Initial Setup

After accessing CasaOS through your browser, you will land on the dashboard. CasaOS offers a straightforward interface to manage your home cloud.

### Configuring CasaOS

- **Dashboard**: View the status and quick info about your CasaOS setup.
- **App Store**: Install and manage Docker-based applications easily.
- **File Management**: Organize and manage your files stored in CasaOS.
- **Settings**: Configure system settings, network, and other preferences.

### Adding Applications

To add applications via the App Store:

1. Navigate to the "App Store" from the left sidebar.
2. Browse or search for applications.
3. Click on an application and follow the prompts to install it.

### File Management

CasaOS simplifies file storage and sharing:

1. Access the "Files" section from the dashboard.
2. You can upload, download, and manage your files here.

## Conclusion

CasaOS offers an easy way to set up a personal home cloud, leveraging Docker for application management. It's suitable for those looking for a simple solution to manage personal data and run home services.

For more detailed information and advanced configurations, visit the [official CasaOS documentation](https://docs.casaos.io/).
