## VirtualBox

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
