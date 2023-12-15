# Setting Up pfSense Router in VirtualBox

### Step 1: Download pfSense

1. **Download the pfSense ISO**:
   - Visit the [pfSense download page](https://www.pfsense.org/download/).
   - Select the appropriate version (most likely the latest stable release).
   - Choose the architecture (AMD64 for most users) and the installer type (CD Image (ISO) installer).
   - Download the ISO file to your system.

### Step 2: Prepare VirtualBox

1. **Open VirtualBox**:
   - Ensure you have Oracle VM VirtualBox installed on your system. If not, download and install it from the [VirtualBox website](https://www.virtualbox.org/).

2. **Create a New Virtual Machine**:
   - Click on "New" to create a new VM.
   - Name your VM (e.g., "pfSense Router").
   - For the type, select "BSD"; for the version, select "FreeBSD (64-bit)".

3. **Allocate Memory**:
   - Allocate an appropriate amount of RAM. 512 MB should be sufficient for basic pfSense setup.

4. **Create a Virtual Hard Disk**:
   - Choose to create a virtual hard disk now.
   - Select VDI (VirtualBox Disk Image) as the hard disk file type.
   - Choose dynamically allocated or fixed size as per your preference.
   - Allocate disk space (8 GB should be enough for basic use).

### Step 3: Configure Network Adapters

1. **Configure First Network Adapter (NAT Network)**:
   - With your pfSense VM selected, go to "Settings" -> "Network".
   - In the "Adapter 1" tab, ensure it's enabled and attached to "NAT".

2. **Configure Second Network Adapter (Internal Network/Host-Only)**:
   - Go to the "Adapter 2" tab.
   - Enable the adapter.
   - Set "Attached to" to "Internal Network" or "Host-Only Adapter" depending on your needs.
   - For "Internal Network", you may leave the name as "intnet" or choose/create another internal network name.

### Step 4: Mount pfSense ISO

1. **Attach pfSense ISO to VM**:
   - Go to "Settings" -> "Storage".
   - Next to "Controller: IDE", click on the CD icon to add an optical drive.
   - Select the pfSense ISO file you downloaded earlier.

### Step 5: Install pfSense

1. **Start the VM and Install pfSense**:
   - Click "Start" to boot up your VM.
   - The pfSense installer should load.
   - Follow the on-screen instructions to install pfSense.
   - When prompted, accept the default settings unless you have specific custom configurations in mind.
   - Once installation is complete, pfSense may ask to reboot.

### Step 6: Initial Setup of pfSense

1. **Complete Initial Setup**:
   - After rebooting, pfSense will ask you to assign interfaces.
   - The WAN interface will typically be `em0` (first adapter, NAT), and the LAN interface will be `em1` (second adapter, Internal Network/Host-Only).
   - Proceed with the initial setup, configuring interfaces as necessary.
   - Once completed, pfSense will display the LAN interface's IP address.

### Step 7: Access pfSense Web Interface

1. **Access the Web Interface**:
   - From a host machine or a VM within the same internal network/host-only network, open a web browser.
   - Navigate to the IP address displayed by pfSense on the LAN interface.
   - The default username is `admin` and the password is `pfsense`.

2. **Final Configuration**:
   - Use the web interface to complete the setup wizard.
   - Configure your firewall rules, DHCP server settings, NAT, and other necessary settings.

## Additional Tips

- **Backup**: Always backup your VM before making significant changes.
- **Documentation**: Refer to the pfSense and VirtualBox documentation for additional details or troubleshooting.
- **Testing**: Use this setup in a controlled environment for testing and learning purposes.
