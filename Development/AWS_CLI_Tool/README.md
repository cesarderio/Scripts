# AWS Management CLI Tool

![AWS CLI TOOL](../../assets/aws_cli_t.png)

**AWS Management CLI Tool** is a powerful, user-friendly command-line utility designed to streamline your AWS resource management tasks. Instead of navigating through the AWS Console or writing custom scripts, use this tool to quickly view, manage, and monitor your cloud resources.

## **Table of Contents**

- [Overview](#overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Script Workflow](#script-workflow)
- [Output](#output)
- [Compatibility](#compatibility)
- [Notes](#notes)
- [Contribution](#contribution)
- [Author](#author)

## **Overview**

The AWS Management CLI Tool simplifies the process of managing AWS services by providing an interactive command-line interface that enables users to perform a wide range of AWS tasks with minimal effort. From managing EC2 instances to reviewing security groups, this tool centralizes AWS service management into one utility.

## **Features**

- **Interactive Navigation**: Traverse seamlessly through multiple AWS service categories using a clear, structured menu.

- **Unified Management**: Why juggle between different AWS tools when you can have one? From EC2 to Lambda to S3, manage them all from one place.

- **Detailed Listings**: Get comprehensive views of your AWS resources. Whether it's spotting a rogue EC2 instance or checking the permissions on an S3 bucket, this tool has you covered.

- **Error Handling**: No more cryptic AWS errors. Our tool provides clear error messages to help diagnose issues quickly.

- **Extensibility**: Built with modularity in mind, it's easy to extend the tool to incorporate more AWS services or additional functionalities.

## 🛠️ Getting Started

## **Prerequisites**

- **Python 3.x**
- **Boto3**: The AWS SDK for Python. Install it with pip:

  ```bash
  pip install boto3
  ```

- Properly configured AWS Credentials, either using environment variables or the `~/.aws/credentials` file.

## Usage

1. Ensure you are in the directory containing the script.
2. Run the script:

   ```bash
   python AWS_Recon.py
   ```

3. Navigate through the interactive menu to manage or list AWS resources.

### Available Options

1. **Compute**:
    - List EC2 Instances
    - List Lambda Functions
    - List Elastic Beanstalk Apps Environments

2. **Storage**:
    - List Public S3 Buckets
    - List S3 Bucket Permissions
    - List Dynamodb Tables
    - List EBS Volumes

3. **Database**:
    - List RDS Instances

4. **Network**:
    - List VPCs & Subnets
    - List Security Groups & Rules
    - List Elastic Load Balancers
    - List Cloudfront Distributions
    - List Route53 Zones Records
    - List VPC Peering Connections
    - List Direct Connect Connections

5. **Containers**:
    - List ECS Clusters & Services

6. **Security**:
    - List IAM Users
    - List IAM Roles Policies

7. **Monitor**:
    - List Cloudwatch Alarms

8. **Development**:
    - List API Gateway APIs

### Error Handling

The tool provides basic error handling, ensuring that any AWS-related errors are displayed in a user-friendly manner. If you encounter issues not covered by the error handling, please check your AWS setup and credentials.


## **Script Workflow**

1. AWS SDK Initialization: Initializes Boto3 to interface with AWS services.

1. Interactive Menu: Prompts the user with a menu of AWS service categories.

1. Service Selection: Upon selecting a service, the script fetches and displays resource data based on the chosen option.

1. Error Handling: If the script encounters any issues (e.g., missing credentials or permission errors), it will provide informative messages to guide troubleshooting.

1. Exit: The user can exit the program at any time by selecting the quit option.

## **Output**

- Resource Lists: The script will list resources such as EC2 instances, S3 buckets, RDS instances, etc., based on user selection.

- Error Messages: If there are issues (e.g., missing permissions), the script will display specific error messages to assist in diagnosing and resolving problems.

- Interactive Prompts: The tool uses an interactive CLI interface to guide users through AWS resource management tasks.

## **Compatibility**

- Supported Systems: This script is compatible with systems running Python 3.x and Boto3.

- Dependencies: Requires an active internet connection and AWS credentials configured.

- AWS Region: The script uses the default AWS region set in your AWS credentials or environment variables.

## **Notes**

- AWS Permissions: Ensure the AWS user running this tool has sufficient permissions to list and manage the selected resources.

- Environment Variables: AWS credentials can be configured via environment variables for ease of use, especially in automated environments.

## **Contribution**

Your contributions can make these scripts even better:

1. Fork the repository.
1. Create a new branch:

  ```bash
  git checkout -b my-awesome-feature
  ```

1. Make your invaluable changes.
1. Commit your changes:

  ```bash
  git commit -am 'Added some amazing features'
  ```

1. Push to the branch:

  ```bash
  git push origin my-awesome-feature
  ```

1. Create a new Pull Request targeting the Development directory.

Contributions are welcome! Feel free to open issues, suggest enhancements, or submit pull requests to improve the script.

## **Author**

- **Raphael Chookagian**

## **Date of Latest Revision**

- 12/07/2024

## **License**

- This script is provided as-is without any warranties. Users are advised to review and understand the script before executing it.

- This project is licensed under the MIT License. See the LICENSE file for details.
