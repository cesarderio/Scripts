# Linux Commands Cheat Sheet

This cheat sheet is a comprehensive guide for Linux commands, tailored for DevOps professionals and enthusiasts. It aims to provide quick references, practical examples, and best practices for efficient Linux system management.

<br>

## Basic Commands

- **`ls`**: List files and directories. E.g., `ls -l` for a detailed list, `ls -a` for all files.
- **`cd [directory]`**: Change the current directory. E.g., `cd /home/user`.
- **`pwd`**: Print the current working directory path.
- **`mkdir [directory]`**: Create a new directory. E.g., `mkdir new_folder`.
- **`touch [file]`**: Create an empty file. E.g., `touch new_file.txt`.
- **`rm [file/directory]`**: Remove files or directories. E.g., `rm file.txt`.
- **`cp [source] [destination]`**: Copy files and directories. E.g., `cp file.txt /home/user/`.
- **`mv [source] [destination]`**: Move or rename files and directories. E.g., `mv file.txt new_file.txt`.

<br>

## Managing Packages

- **`apt`** or **`yum`**: Package managers for Debian-based and Red Hat-based systems.
  - `apt-get install [package]` or `yum install [package]`: Install packages.
  - `apt-get update` or `yum update`: Update package lists.
  - `apt-get upgrade` or `yum upgrade`: Upgrade installed packages.
  - `apt-get remove` or `yum remove`: Uninstall packages.

<br>

## File Manipulation

- **`cat [file]`**: Display file content. E.g., `cat file.txt`.
- **`more`** or **`less [file]`**: View long files one screen at a time.
- **`head [file]`** and **`tail [file]`**: Display the beginning or end of a file.
- **`grep [pattern] [file]`**: Search for text patterns in files.
- **`find [path] [expression]`**: Search for files and directories.
- **`wc [file]`**: Count lines, words, and characters in a file.
- **`chmod [permissions] [file]`**: Change file permissions.
- **`chown [owner] [file]`**: Change file ownership.

<br>

## Process Management

- **`ps`**: List running processes.
- **`top`** or **`htop`**: Monitor system activity and processes.
- **`kill [process_id]`** or **`pkill [process_name]`**: Terminate processes.

<br>

## Network and Connectivity

- **`ifconfig`** or **`ip`**: Configure network interfaces.
- **`ping [destination]`** or **`traceroute [destination]`**: Test network connectivity.
- **`netstat`** or **`ss`**: Display network statistics.
- **`ssh [user@host]`** or **`scp [source] [destination]`**: Securely connect and transfer files.
- **`wget [url]`** or **`curl [url]`**: Download files from the web.

<br>

## System Information

- **`uname`**: Display system information.
- **`df`** or **`du`**: Check disk usage.
- **`free`** or **`vmstat`**: Monitor system memory.
- **`uptime`** or **`who`**: View system uptime and logged-in users.
- **`dmesg`** or **`journalctl`**: Check system logs.

<br>

## Automation with Scripts

- **`#!/bin/bash`**: Start a shell script.
- **`for`** and **`while`** loops: Create repetitive tasks.
- **`if-then-else`** statements: Implement conditional logic.
- **`cron`** or **`systemd timers`**: Schedule tasks.

<br>

## Essential Tips and Tricks

- Tab completion: Press the Tab key to auto-complete commands and file paths.
- Ctrl+C and Ctrl+Z: Terminate or pause running processes.
- Ctrl+D: Log out of a terminal.
- `history`: Review command history.
- `!` followed by a number or text: Execute a previously run command.
- `alias`: Create shortcuts for long or complex commands.
- **`man`** or **`info`**: Access manual pages for command documentation.

<br>

## Additional Commands

<br>

### File System and Disk Usage

- **`df -h`**: Display disk space usage in human-readable format.
- **`du -sh [directory]`**: Show the size of a directory in a human-readable format.

<br>

### Advanced File Manipulation

- **`sed`**: Stream editor for filtering and transforming text.
- **`awk`**: Powerful text processing language.
- **`rsync`**: Fast and versatile tool for copying files remotely and locally.

<br>

### System Monitoring

- **`iotop`**: Monitor I/O usage by processes.
- **`nmon`**: Performance monitoring tool for Linux.

<br>

### Network Diagnostics

- **`dig [domain]`**: Query DNS name servers for information about host addresses, mail exchanges, etc.
- **`tcpdump`**: Dump traffic on a network.
- **`nmap`**: Network exploration tool and security / port scanner.

<br>

## Additional Tips and Tricks

<br>

### Command Line Efficiency

- **Globbing**: Use wildcard characters like `*` and `?` for file matching. E.g., `rm *.txt` to remove all text files.
- **Redirection and Piping**: Use `>` for redirecting output and `|` for piping output from one command to another. E.g., `grep 'text' file.txt | less`.
- **Command Substitution**: Use `$(command)` to use the output of a command as an argument to another command. E.g., `cd $(dirname $(find / -name filename.txt))`.

<br>

### Keyboard Shortcuts

- **Ctrl+R**: Search through command history.
- **Ctrl+L**: Clear the terminal screen.

<br>

### Customizing the Shell

- **Shell Aliases**: Add more examples of useful aliases.
- **Shell Prompt Customization**: Guide on customizing the prompt (PS1) for better usability.

<br>

### File Editing

- **`nano`**, **`vi`**, or **`emacs`**: Introduce basic usage of these text editors for editing configuration files and scripts.

<!-- ## Additional Sections -->

<br>

### Security Commands

- **`chmod`** and **`chown`** Examples: Provide more examples for setting file permissions and ownership.
- **`ufw`** or **`firewalld`**: Basics of firewall setup and management.

<br>

## Scripting Examples

<br>

### Example 1: Directory Cleanup Script

This script demonstrates how to use loops, conditionals, and functions to clean up old files in a specified directory.

```bash
#!/bin/bash

# Function to delete files older than a specified number of days
cleanup_old_files() {
    local dir=$1
    local days=$2
    echo "Cleaning up files older than $days days in $dir..."
    find "$dir" -type f -mtime +$days -exec rm -f {} \;
}

# Main script logic
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <days>"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: Directory $1 not found."
    exit 1
fi

cleanup_old_files "$1" "$2"
echo "Cleanup completed."
```

Usage: `./cleanup_script.sh /path/to/directory 30`
(This script will delete files in the specified directory that are older than 30 days.)

<br>

### Example 2: System Health Check Script

This script uses loops, conditionals, and system commands to perform a basic system health check.

```bash
#!/bin/bash

# Function to check disk space usage
check_disk_space() {
    echo "Checking disk space usage..."
    df -h | grep '^/dev'
}

# Function to check load average
check_load_average() {
    echo "Checking load average..."
    uptime
}

# Function to check memory usage
check_memory_usage() {
    echo "Checking memory usage..."
    free -m
}

# Main script body
echo "Starting system health check..."

declare -a check_funcs=("check_disk_space" "check_load_average" "check_memory_usage")

# Loop through and call each function
for func in "${check_funcs[@]}"; do
    $func
    echo ""
done

echo "Health check completed."
```

Usage: `./health_check_script.sh`
(This script will display the disk space usage, load average, and memory usage of the system.)

<br>

## Troubleshooting Common Issues

<br>

### System Recovery

When dealing with system recovery, it's crucial to have a basic understanding of diagnostic and repair commands. Here are some common tools and their uses:

- **`fsck`**: This command checks the integrity of the filesystem and repairs it if necessary. It's often used when a system fails to boot properly. Usage: `fsck [options] [device]`, e.g., `fsck /dev/sda1`. It's important not to run `fsck` on a mounted filesystem to avoid data corruption.

- **Recovery Mode**: If you can't boot into your regular desktop, most Linux distributions offer a Recovery Mode in the GRUB menu. Use this mode to perform system repairs.

- **`dmesg`**: Displays kernel-related logs, useful for identifying hardware and driver issues. It's often one of the first tools to use when diagnosing boot problems.

- **Live USB/CD**: Booting from a Live USB or CD can be a lifesaver for accessing and repairing a system that won't boot. From here, you can access files, check logs, and repair partitions.

- **Backup and Restore Commands**: Knowing how to backup (`tar`, `rsync`) and restore your data is crucial. Regular backups can mitigate the damage caused by system failures.

<br>

### Networking Issues

Networking problems are common in any system. Here are basic commands to troubleshoot network connectivity:

- **`ping`**: Test the ability to reach a host. `ping [hostname or IP]` helps determine if a host is reachable.

- **`ifconfig`** or **`ip addr`**: Display network interface configuration. It’s essential for diagnosing a network interface that is down or misconfigured.

- **`traceroute`** or **`tracepath`**: Trace the path packets take to reach a host. Helpful to pinpoint where the connection fails or slows down.

- **`netstat`** or **`ss`**: These commands provide various network-related information like socket statistics. They are useful to check open ports and active connections.

- **`nslookup`** or **`dig`**: These DNS lookup tools help diagnose DNS problems. They show the IP address associated with a hostname.

- **`nmap`**: Network exploration tool and security scanner. Useful for network inventory, managing service upgrade schedules, and monitoring host or service uptime.

- **Wi-Fi Troubleshooting**: Commands like `iwconfig` or `iwlist scan` are useful for diagnosing wireless connectivity issues.

- **`tcpdump`**: This command captures and analyzes network traffic packets. Useful for in-depth network traffic analysis to identify issues.

- **Firewall Check**: Commands like `ufw status` or `iptables -L` can help diagnose issues related to firewall configurations.

<br>

## Version Control

<br>

### Basic Git Commands

Git is a widely-used version control system that allows multiple people to work on the same codebase. It helps in tracking changes, collaborating with others, and reverting to previous states if necessary. Here are some fundamental Git commands:

- **`git init`**: Initializes a new Git repository. This command creates a new `.git` directory in your project, turning the current directory into a Git repository.

- **`git clone [url]`**: Creates a copy of an existing Git repository. The URL is the location of the Git repository you want to clone. E.g., `git clone https://github.com/user/repo.git`.

- **`git add [file or directory]`**: Adds files or changes in a directory to the staging area. It tells Git that you want to include updates to these files in the next commit. To add everything, use `git add .`.

- **`git commit -m "[commit message]"`**: Records or snapshots the file permanently in the version history along with a message describing the change. E.g., `git commit -m "Fixed bug in data processing"`.

- **`git status`**: Displays the state of the working directory and the staging area. It lets you see which changes have been staged, which haven't, and which files aren't being tracked by Git.

- **`git push [remote-name] [branch-name]`**: Pushes the changes in your local repository up to the remote repository you specify. E.g., `git push origin master`.

- **`git pull`**: Fetches and merges changes from the remote server to your working directory.

- **`git branch`**: Lists all the branches in your repo. Adding a branch name, like `git branch [branch-name]`, creates a new branch.

- **`git checkout [branch-name]`**: Switches to the specified branch and updates the working directory.

- **`git merge [branch]`**: Merges the specified branch’s history into the current branch.

- **`git log`**: Shows the commit logs.

- **`git diff`**: Shows the file differences not yet staged.

- **`git reset [file]`**: Unstages the file, but it preserves the file contents.

- **`git revert [commit]`**: Generates a new commit that undoes all of the changes introduced in `[commit]`, then applies it to the current branch.

<br>

## Containerization and Virtualization

<br>

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

<br>

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

<br>
<br>

## VirtualBox

<br>

### VBoxManage Commands

VBoxManage commands are used for managing VirtualBox VMs via the command line. These commands cover a wide range of functionalities from creating and controlling VMs to adjusting network settings and managing disk images, offering a practical approach for direct and scriptable VirtualBox management.

- **List all Virtual Machines**:
  - `VBoxManage list vms`: Lists all registered VMs.

- **Start a Virtual Machine**:
  - `VBoxManage startvm [vmname] --type headless`: Starts a VM named `[vmname]` in headless mode (without a GUI).
  - `VBoxManage startvm [vmname] --type gui`: Starts a VM with a GUI.

- **Power off a Virtual Machine**:
  - `VBoxManage controlvm [vmname] poweroff`: Powers off the VM named `[vmname]`.

- **Pause and Resume a Virtual Machine**:
  - `VBoxManage controlvm [vmname] pause`: Pauses the VM.
  - `VBoxManage controlvm [vmname] resume`: Resumes a paused VM.

- **Create a Virtual Machine**:
  - `VBoxManage createvm --name [vmname] --register`: Creates a new VM with the name `[vmname]`.

- **Modify VM Settings**:
  - `VBoxManage modifyvm [vmname] --memory [memorysize in MB]`: Sets the memory size of the VM.
  - `VBoxManage modifyvm [vmname] --cpus [number]`: Sets the number of CPUs for the VM.
  - `VBoxManage modifyvm [vmname] --vrde on`: Enables the VirtualBox Remote Desktop Extension.

- **Attach an ISO to VM**:
  - `VBoxManage storageattach [vmname] --storagectl [controllername] --port 0 --device 0 --type dvddrive --medium [path/to/iso]`: Attaches an ISO file to the VM.

- **Create a Virtual Hard Disk**:
  - `VBoxManage createmedium disk --filename [path/to/vdi] --size [size in MB]`: Creates a new virtual hard disk file.

- **Take a Snapshot**:
  - `VBoxManage snapshot [vmname] take [snapshotname]`: Takes a snapshot of the VM.

- **Restore a Snapshot**:
  - `VBoxManage snapshot [vmname] restore [snapshotname]`: Restores the VM to a snapshot.

- **Delete a Virtual Machine**:
  - `VBoxManage unregistervm [vmname] --delete`: Deletes the VM and all its associated files.

- **Configure Network Settings**:
  - `VBoxManage modifyvm [vmname] --nic1 nat`: Sets the first network adapter of the VM to use NAT.

- **Show VM Information**:
  - `VBoxManage showvminfo [vmname]`: Displays detailed information about the VM.
