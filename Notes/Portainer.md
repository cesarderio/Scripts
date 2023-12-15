# Portainer Tutorial

This tutorial covers the installation and basic usage of Portainer, an open-source tool designed to help manage Docker environments. Portainer provides a user-friendly web interface to manage Docker containers, images, networks, and volumes.

## Prerequisites

- Docker installed on your system. If Docker is not installed, refer to the [Docker installation guide](https://docs.docker.com/get-docker/).

## Installation

### Step 1: Pull the Portainer Image

First, pull the Portainer Docker image from the Docker Hub:

```bash
docker pull portainer/portainer-ce
```

### Step 2: Run Portainer

Run the Portainer container with the following command:

```bash
docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```

This command does the following:

- `-d` runs the container in detached mode.
- `-p 9000:9000` maps the container's port 9000 to the host's port 9000.
- `--name=portainer` names the container as 'portainer'.
- `--restart=always` ensures the container restarts automatically if it stops.
- `-v /var/run/docker.sock:/var/run/docker.sock` mounts the Docker socket.
- `-v portainer_data:/data` creates a volume for Portainer data persistence.

## Accessing Portainer

Once Portainer is running, access it by opening your web browser and navigating to:

```
http://<YOUR-DOCKER-HOST-IP>:9000
```

Replace `<YOUR-DOCKER-HOST-IP>` with the IP address of your Docker host.

## Initial Setup

1. **Create an Admin User**:
   - Upon first accessing Portainer, you'll be prompted to create an admin user.
   - Enter a username and password, then click "Create user".

2. **Connect to Docker**:
   - Select "Docker" as the environment to manage.
   - Click "Connect".

## Using Portainer

With Portainer, you can manage various aspects of your Docker environment:

- **Containers**: Start, stop, create, and remove containers.
- **Images**: Pull, push, and manage Docker images.
- **Networks**: Create and manage Docker networks.
- **Volumes**: Create and manage Docker volumes.
- **Settings**: Customize Portainer settings.

### Managing Containers

To manage Docker containers:

1. Click on "Containers" in the left sidebar.
2. Here, you can view running containers, start/stop existing containers, or create new ones.

### Managing Images

To manage Docker images:

1. Click on "Images" in the left sidebar.
2. You can pull new images from Docker Hub, remove existing images, or deploy containers from images.

## Conclusion

Portainer simplifies Docker management, making it easier to handle containers, images, networks, and volumes through a user-friendly interface. It's a valuable tool for anyone working with Docker, from beginners to experienced users.

For more advanced features and detailed usage, refer to the [official Portainer documentation](https://documentation.portainer.io/).
