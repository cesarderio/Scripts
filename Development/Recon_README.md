# Nmap Automation Tool

Nmap Automation Tool is a Python-based script that simplifies the process of network scanning. It integrates with tools like `nikto`, `gobuster`, and `enum4linux` to provide a comprehensive view of potential vulnerabilities in a network.

## Features

- **Subnet Scanning**: Input a subnet to get a list of live hosts.
- **Multiple Scan Types**: Choose from SYN ACK, UDP, or a comprehensive scan.
- **Integrated Tools**: Automatically runs tools like `nikto`, `gobuster`, and `enum4linux` based on detected services.
- **Threading**: Scans multiple targets concurrently for faster results.
- **Detailed Reports**: Saves scan results in a structured JSON format on the desktop with a timestamp.

## Prerequisites

- Python 3.x
- Nmap
- Nikto
- Gobuster
- Enum4linux

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/cesarderio/Scripts.git
   cd Scripts/Development/
   ```

2. Run the script:

   ```bash
   python3 Recon.py
   ```

3. Follow the on-screen prompts to input IP addresses or subnets, select scan types, and provide other necessary information.

4. Once the scan is complete, check your desktop for a JSON file containing the results. The filename will include the target IP and the date and time of the scan.

## Safety & Ethics

Always ensure you have permission to scan the target IPs and use the tools. Unauthorized scanning can be illegal and unethical. Use this tool responsibly.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
