### Setting Up an OPNsense Router in VirtualBox

#### Step 1: Download OPNsense

1. **Download the OPNsense ISO**:
   - Visit the [OPNsense download page](https://opnsense.org/download/).
   - Select the appropriate version (usually the latest stable release).
   - Download the ISO file for installation.

#### Step 2: Prepare VirtualBox

1. **Open VirtualBox**:
   - Ensure Oracle VM VirtualBox is installed on your system. Download it from the [VirtualBox website](https://www.virtualbox.org/) if needed.

2. **Create a New Virtual Machine**:
   - Click on "New" to create a new VM.
   - Name your VM (e.g., "OPNsense Router").
   - For the type, select "BSD"; for the version, select "FreeBSD (64-bit)".

3. **Allocate Memory**:
   - Allocate an appropriate amount of RAM. 512 MB to 1 GB should be sufficient for basic OPNsense setup.

4. **Create a Virtual Hard Disk**:
   - Choose to create a virtual hard disk now.
   - Select VDI (VirtualBox Disk Image) as the hard disk file type.
   - Choose dynamically allocated or fixed size as per your preference.
   - Allocate disk space (10 GB should be enough for basic use).

#### Step 3: Configure Network Adapters

1. **Configure First Network Adapter (NAT Network)**:
   - With your OPNsense VM selected, go to "Settings" -> "Network".
   - In the "Adapter 1" tab, ensure it's enabled and attached to "NAT".

2. **Configure Second Network Adapter (Internal Network/Host-Only)**:
   - Go to the "Adapter 2" tab.
   - Enable the adapter.
   - Set "Attached to" to "Internal Network" or "Host-Only Adapter" depending on your needs.
   - For "Internal Network", you may leave the name as "intnet" or choose/create another internal network name.

#### Step 4: Mount OPNsense ISO

1. **Attach OPNsense ISO to VM**:
   - Go to "Settings" -> "Storage".
   - Next to "Controller: IDE", click on the CD icon to add an optical drive.
   - Select the OPNsense ISO file you downloaded earlier.

#### Step 5: Install OPNsense

1. **Start the VM and Install OPNsense**:
   - Click "Start" to boot up your VM.
   - The OPNsense installer should load.
   - Follow the on-screen instructions to install OPNsense.
   - Accept default settings or customize as needed.
   - Once installation is complete, OPNsense may ask to reboot.

#### Step 6: Initial Setup of OPNsense

1. **Complete Initial Setup**:
   - After rebooting, OPNsense will ask you to assign interfaces.
   - The WAN interface will typically be `vtnet0` (first adapter, NAT), and the LAN interface will be `vtnet1` (second adapter, Internal Network/Host-Only).
   - Proceed with the initial setup, configuring interfaces as necessary.
   - Once completed, OPNsense will display the LAN interface's IP address.

#### Step 7: Access OPNsense Web Interface

1. **Access the Web Interface**:
   - From a host machine or a VM within the same internal network/host-only network, open a web browser.
   - Navigate to the IP address displayed by OPNsense on the LAN interface.
   - The default username is `root` and the password is `opnsense`.

2. **Final Configuration**:
   - Use the web interface to complete the setup wizard.
   - Configure your firewall rules, DHCP server settings, NAT, and other necessary settings.

### Additional Tips

- **Backup**: Always backup your VM before making significant changes.
- **Documentation**: Refer to the OPNsense and VirtualBox documentation for additional details or troubleshooting.
- **Testing**: Use this setup in a controlled environment for testing and learning purposes.
