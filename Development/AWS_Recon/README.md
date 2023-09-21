![](../../assets/hood.png)

# AWS Management CLI Tool

This script provides a command-line interface for managing and listing various AWS services.

## Features

- Interactively navigate through various AWS service categories.
- View and manage resources such as EC2 instances, Lambda functions, S3 buckets, and more.

## Requirements

- **Python 3.x**
- **AWS SDK for Python (Boto3)** – Ensure you have this installed using pip:

  ```bash
  pip install boto3
  ```

- AWS Credentials set up, either via environment variables or `~/.aws/credentials`.

## Usage

1. Ensure you are in the directory containing the script.
2. Run the script:

   ```bash
   python AWS_Recon.py
   ```

3. Navigate through the interactive menu to manage or list AWS resources.

## Available Options

1. **Compute**:
    - List EC2 Instances
    - List Lambda Functions
    - List Elastic Beanstalk Apps Environments

2. **Storage**:
    - List Public S3 Buckets
    - List S3 Bucket Permissions
    - List Dynamodb Tables
    - List EBS Volumes

... [List all other categories and options similarly] ...

## Error Handling

The tool provides basic error handling, ensuring that any AWS-related errors are displayed in a user-friendly manner. If you encounter issues not covered by the error handling, please check your AWS setup and credentials.
