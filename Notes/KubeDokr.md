## Containerization and Virtualization

### Docker Commands

Docker is a popular tool for containerization, allowing you to package applications into containers—standardized executable components combining application source code with the operating system (OS) libraries and dependencies required to run that code in any environment.

- **`docker run [options] [image]`**: Runs a Docker container from an image. E.g., `docker run -d -p 80:80 nginx` runs an Nginx server in detached mode and maps port 80.

- **`docker build -t [tag] .`**: Builds a Docker image from a Dockerfile in the current directory. The `-t` flag tags the image with a name.

- **`docker images`**: Lists all Docker images on the local system.

- **`docker ps`**: Lists running containers. Use `docker ps -a` to list all containers.

- **`docker stop [container_id]`**: Stops a running container.

- **`docker rm [container_id]`**: Removes a container.

- **`docker rmi [image_id]`**: Removes a Docker image.

- **`docker pull [image]`**: Pulls a Docker image from Docker Hub or other registries.

- **`docker exec -it [container_id] [command]`**: Executes a command inside a running container, e.g., accessing the shell.

### Kubernetes Commands

Kubernetes is an orchestration system for Docker containers, automating their deployment, scaling, and operations.

- **`kubectl get pods`**: Lists all pods in the current namespace.

- **`kubectl create -f [file.yml]`**: Creates a resource (like a pod, service, etc.) defined in a YAML file.

- **`kubectl apply -f [file.yml]`**: Applies changes to a resource defined in a YAML file.

- **`kubectl delete -f [file.yml]`**: Deletes a resource defined in a YAML file.

- **`kubectl describe [resource] [name]`**: Shows detailed information about a specific resource, e.g., `kubectl describe pod my-pod`.

- **`kubectl logs [pod_name]`**: Fetches logs from a specific pod. Useful for debugging.

- **`kubectl port-forward [pod_name] [local_port]:[pod_port]`**: Forwards a local port to a port on the pod. This is useful for testing purposes.

- **`kubectl scale --replicas=[n] [resource_type] [resource_name]`**: Scales a resource, like a deployment, to the specified number of replicas.

- **`kubectl exec -it [pod_name] -- [command]`**: Executes a command inside a pod, often used to get an interactive shell.
