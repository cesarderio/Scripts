# Install OpenWRT in VirtualBox VM

## Step 1: Download and Prepare the OpenWRT Image

1. **Download OpenWRT x86 Image**:
   - Go to the [OpenWRT downloads page](https://downloads.openwrt.org/releases/) and download the appropriate x86/64 image (e.g., `openwrt-19.07.6-x86-64-combined-ext4.img`).

2. **Convert the OpenWRT Image to VDI Format**:
   - Open a command prompt or terminal.
   - Navigate to your VirtualBox installation directory:

     ```bash
     cd "%programfiles%/Oracle/Virtualbox"
     ```

   - Convert the downloaded image to VDI format:

     ```bash
     vboxmanage.exe convertdd "%userprofile%\downloads\openwrt-19.07.6-x86-64-combined-ext4.img" "%userprofile%\downloads\openwrt.vdi"
     ```

3. **Resize the VDI File**:
   - Resize the VDI file to increase its size (e.g., 512 MB):

     ```bash
     vboxmanage.exe modifyhd --resize 512 "%userprofile%\downloads\openwrt.vdi"
     ```

## Step 2: Create a New Virtual Machine in VirtualBox

1. **Launch VirtualBox**:
   - Open Oracle VM VirtualBox.

2. **Create a New VM**:
   - Select "Machine" > "New".
   - Fill in the details:
     - Name: OpenWRT
     - Machine Folder: `C:\VMs`
     - Type: Linux
     - Version: 2.6 / 3.x / 4.x (64-bit)
     - Memory Size: 128 MB
   - Select "Do not add a virtual hard disk".
   - Click "Create".

3. **Move the VDI File**:
   - Move `openwrt.vdi` from the downloads folder to `C:\VMs\OpenWRT`.

## Step 3: Configure the VM

1. **Select the VM and Access Settings**:
   - Select the newly created OpenWRT VM.
   - Click on "Settings".

2. **Set Up Storage**:
   - Go to "Storage".
   - Click on "Add Storage Attachment" > "Add Hard Disk" > "Choose existing disk".
   - Browse to `C:\VMs\OpenWRT\openwrt.vdi` and select the file.
   - Click "OK".

3. **Configure Network Adapters**:
   - Go to "Network".
   - **Adapter 1**: Set "Attached to" as "Bridged".
   - **Adapter 2**: Enable the adapter and set "Attached to" as "Bridged".
   - Click "OK".

## Step 4: Start the VM and Configure OpenWRT

1. **Start the VM**:
   - Ensure the OpenWRT VM is selected.
   - Click "Start" > "Normal".

2. **Initial Setup in OpenWRT**:
   - Wait for the text to stop scrolling in the VM console and press Enter.
   - Set the root password:

     ```bash
     passwd
     ```

   - Enter a new root password twice as prompted.

3. **Configure Network and Install Luci**:
   - Set the LAN IP address:

     ```bash
     uci set network.lan.ipaddr='192.168.0.251'
     ```

   - Restart network services:

     ```bash
     service network restart
     ```

   - Update OpenWRT packages:

     ```bash
     opkg update
     ```

   - Install the Luci web UI:

     ```bash
     opkg install luci
     ```

## Step 5: Access the Web Interface

1. **Open a Web Browser**:
   - Navigate to the OpenWRT VM's IP address (e.g., `http://192.168.0.251`).

2. **Log in to OpenWRT**:
   - At the login screen, enter the username `root` and the password you set earlier.
   - Click the "Login" button.

3. **Enjoy OpenWRT**:
   - You now have OpenWRT running in VirtualBox. Configure it as needed for your network setup.

## Additional Tips

- **VirtualBox Version**: Ensure your VirtualBox is up to date for compatibility.
- **Backup**: Regularly backup your VM.
- **Documentation**: For more details or troubleshooting, refer to OpenWRT and VirtualBox documentation.
