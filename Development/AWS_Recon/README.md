![](../../assets/hood.png)

# AWS Management CLI Tool

**AWS Management CLI Tool** is a powerful, user-friendly command-line utility designed to streamline your AWS resource management tasks. Instead of navigating through the AWS Console or writing custom scripts, use this tool to quickly view, manage, and monitor your cloud resources.

## 🚀 Features

- **Interactive Navigation**: Traverse seamlessly through multiple AWS service categories using a clear, structured menu.

- **Unified Management**: Why juggle between different AWS tools when you can have one? From EC2 to Lambda to S3, manage them all from one place.

- **Detailed Listings**: Get comprehensive views of your AWS resources. Whether it's spotting a rogue EC2 instance or checking the permissions on an S3 bucket, this tool has you covered.

- **Error Handling**: No more cryptic AWS errors. Our tool provides clear error messages to help diagnose issues quickly.

- **Extensibility**: Built with modularity in mind, it's easy to extend the tool to incorporate more AWS services or additional functionalities.

## 🛠️ Getting Started

### Requirements

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

... [List all other categories and options similarly] ...

### Error Handling

The tool provides basic error handling, ensuring that any AWS-related errors are displayed in a user-friendly manner. If you encounter issues not covered by the error handling, please check your AWS setup and credentials.

## 📝 Feedback & Contributions

We're always looking to improve and expand this tool. If you encounter issues, have feature requests, or want to contribute, please [link to your repository or contact method].

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
