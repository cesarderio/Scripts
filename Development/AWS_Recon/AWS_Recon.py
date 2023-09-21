#!/usr/bin/python3

# Script Name:                  
# Author:                       Raphael Chookagian
# Date of latest revision:      09/20/2023
# Purpose:                      Write a script that:AWS Recon

import boto3
import json
import os
from botocore.exceptions import ClientError

# Compute
def list_ec2_instances():
    try:
        ec2 = boto3.resource('ec2')
        return [instance.id for instance in ec2.instances.all()]
    except boto3.exceptions.botocore.exceptions.EndpointConnectionError:
        print("Network error: Can't connect to AWS.")
    except boto3.exceptions.botocore.exceptions.NoCredentialsError:
        print("Error: AWS credentials not found.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

# --------------------------------------------------------------------

def list_lambda_functions():
    try:
        lambda_client = boto3.client('lambda')
        return [function['FunctionName'] for function in lambda_client.list_functions()['Functions']]
    except boto3.exceptions.botocore.exceptions.EndpointConnectionError:
        print("Network error: Can't connect to AWS.")
    except boto3.exceptions.botocore.exceptions.NoCredentialsError:
        print("Error: AWS credentials not found.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

# --------------------------------------------------------------------

def list_elastic_beanstalk_apps_environments():
    eb = boto3.client('elasticbeanstalk')
    app_envs = {}
    
    try:
        applications = eb.describe_applications()
        if not applications.get('Applications'):
            print("No applications found.")
            return app_envs

        for app in applications['Applications']:
            app_name = app['ApplicationName']
            envs = eb.describe_environments(ApplicationName=app_name)
            if not envs.get('Environments'):
                print(f"No environments found for application: {app_name}")
                continue
            app_envs[app_name] = [env['EnvironmentName'] for env in envs['Environments']]
        return app_envs
    
    except ClientError as e:
        print(f"An error occurred while fetching the Elastic Beanstalk apps and environments: {e}")
        return app_envs

# --------------------------------------------------------------------

# Storage
def list_public_s3_buckets():
    s3 = boto3.client('s3')
    
    public_buckets = []
    try:
        buckets = s3.list_buckets()
        for bucket in buckets['Buckets']:
            bucket_name = bucket['Name']
            acl = s3.get_bucket_acl(Bucket=bucket_name)
            for grant in acl['Grants']:
                # If the bucket has a public grant, append it to public_buckets and break out of the inner loop
                if grant['Grantee']['Type'] == 'Group' and 'AllUsers' in grant['Grantee']['URI']:
                    public_buckets.append(bucket_name)
                    break
                    
    except ClientError as e:
        print(f"An error occurred while fetching the public S3 buckets: {e}")
        return []

    return public_buckets

# --------------------------------------------------------------------

def list_s3_bucket_acl(bucket_name):
    s3 = boto3.client('s3')
    try:
        acl = s3.get_bucket_acl(Bucket=bucket_name)
        return acl['Grants']
    except ClientError as e:
        print(f"An error occurred while fetching the ACL for bucket {bucket_name}: {e}")
        return None


# --------------------------------------------------------------------

def list_dynamodb_tables():
    dynamodb = boto3.client('dynamodb')
    try:
        return dynamodb.list_tables()['TableNames']
    except ClientError as e:
        print(f"An error occurred while listing DynamoDB tables: {e}")
        return None


# --------------------------------------------------------------------

def list_ebs_volumes():
    ec2 = boto3.resource('ec2')
    try:
        return [volume.id for volume in ec2.volumes.all()]
    except ClientError as e:
        print(f"An error occurred while listing EBS volumes: {e}")
        return None

# --------------------------------------------------------------------
# Database

def list_rds_instances():
    rds = boto3.client('rds')
    try:
        return [db['DBInstanceIdentifier'] for db in rds.describe_db_instances()['DBInstances']]
    except ClientError as e:
        print(f"An error occurred while listing RDS instances: {e}")
        return None

# --------------------------------------------------------------------

# Networking & Content Delivery
# --------------------------------------------------------------------

# Use boto3 to fetch VPCs and subnets.
def list_vpcs_and_subnets():
    ec2 = boto3.client('ec2')
    
    try:
        vpcs = ec2.describe_vpcs()
        vpc_subnet_mapping = {}

        for vpc in vpcs['Vpcs']:
            vpc_id = vpc['VpcId']
            subnets = ec2.describe_subnets(Filters=[{'Name': 'vpc-id', 'Values': [vpc_id]}])
            vpc_subnet_mapping[vpc_id] = [subnet['SubnetId'] for subnet in subnets['Subnets']]

        return vpc_subnet_mapping

    except ClientError as e:
        print(f"An error occurred while listing VPCs and subnets: {e}")
        return None

# --------------------------------------------------------------------

# Fetch security groups and their associated rules.
def list_security_groups_and_rules():
    ec2 = boto3.client('ec2')

    # Determine the path to the desktop
    if os.name == 'nt':
        # For Windows
        desktop_path = os.path.join(os.path.join(os.environ['USERPROFILE']), 'Desktop')
    else:
        # For macOS and Linux
        desktop_path = os.path.expanduser("~/Desktop")

    file_path = os.path.join(desktop_path, "security_groups.json")

    try:
        security_groups = ec2.describe_security_groups()
        result = {}

        for sg in security_groups['SecurityGroups']:
            result[sg['GroupId']] = {
                'GroupName': sg['GroupName'],
                'IngressRules': sg['IpPermissions'],
                'EgressRules': sg['IpPermissionsEgress']
            }

        # Convert the result dictionary to a JSON string
        json_output = json.dumps(result, indent=4)

        # Save the JSON string to a file on the desktop
        with open(file_path, 'w') as file:
            file.write(json_output)

        print(f"Security group information saved to {file_path}")
        return json_output

    except ClientError as e:
        print(f"An error occurred while listing Security Groups: {e}")
        return None

# --------------------------------------------------------------------

def list_elastic_load_balancers():
    elb = boto3.client('elbv2')
    
    try:
        return [lb['LoadBalancerName'] for lb in elb.describe_load_balancers()['LoadBalancers']]
        
    except ClientError as e:
        print(f"An error occurred while listing Elastic Load Balancers: {e}")
        return None

# --------------------------------------------------------------------

def list_cloudfront_distributions():
    cf = boto3.client('cloudfront')
    
    try:
        distributions = cf.list_distributions()
        items = distributions.get('DistributionList', {}).get('Items', [])
        return [dist['Id'] for dist in items]

    except ClientError as e:
        print(f"An error occurred while listing CloudFront distributions: {e}")
        return None

# --------------------------------------------------------------------

# Fetch Route 53 hosted zones and record sets.
def list_route53_zones_records():
    r53 = boto3.client('route53')
    zones_records = {}

    try:
        # Pagination for hosted zones
        marker = None
        while True:
            if marker:
                hosted_zones = r53.list_hosted_zones(Marker=marker)
            else:
                hosted_zones = r53.list_hosted_zones()

            for zone in hosted_zones['HostedZones']:
                zone_id = zone['Id']
                zone_name = zone['Name']

                # Pagination for record sets
                record_marker = None
                records = []
                while True:
                    if record_marker:
                        record_sets = r53.list_resource_record_sets(HostedZoneId=zone_id, StartRecordName=record_marker)
                    else:
                        record_sets = r53.list_resource_record_sets(HostedZoneId=zone_id)

                    for record_set in record_sets['ResourceRecordSets']:
                        records.append({
                            'Name': record_set['Name'],
                            'Type': record_set['Type'],
                            'TTL': record_set.get('TTL', None),
                            'Records': [rr['Value'] for rr in record_set.get('ResourceRecords', [])]
                        })

                    # Check for NextRecordName to paginate record sets, break otherwise
                    if 'NextRecordName' in record_sets:
                        record_marker = record_sets['NextRecordName']
                    else:
                        break

                # Store zone name and its records in the dictionary
                zones_records[zone_name] = records

            # Check for NextMarker to paginate hosted zones, break otherwise
            if 'NextMarker' in hosted_zones:
                marker = hosted_zones['NextMarker']
            else:
                break

        return zones_records

    except ClientError as e:
        print(f"An error occurred while fetching Route 53 hosted zones and records: {e}")
        return None

# --------------------------------------------------------------------

# Use boto3 to fetch VPC peering connections.
def list_vpc_peering_connections():
    ec2 = boto3.client('ec2')
    vpc_peering_connections_list = []

    try:
        # Fetch VPC peering connections
        response = ec2.describe_vpc_peering_connections()
        
        for connection in response['VpcPeeringConnections']:
            vpc_peering_details = {
                'PeeringConnectionId': connection['VpcPeeringConnectionId'],
                'RequesterVpcId': connection['RequesterVpcInfo']['VpcId'],
                'AccepterVpcId': connection['AccepterVpcInfo']['VpcId'],
                'Status': connection['Status']['Code'],
                'CreationTimestamp': connection['CreationTimestamp'].strftime('%Y-%m-%d %H:%M:%S')
            }
            vpc_peering_connections_list.append(vpc_peering_details)

        return vpc_peering_connections_list

    except ClientError as e:
        print(f"An error occurred while fetching VPC peering connections: {e}")
        return None

# --------------------------------------------------------------------

# Fetch Direct Connect connections.
def list_direct_connect_connections():
    direct_connect = boto3.client('directconnect')
    direct_connect_connections_list = []

    try:
        # Fetch Direct Connect connections
        response = direct_connect.describe_connections()
        
        for connection in response['connections']:
            connection_details = {
                'ConnectionId': connection['connectionId'],
                'ConnectionName': connection['connectionName'],
                'ConnectionState': connection['connectionState'],
                'Region': connection['region'],
                'Bandwidth': connection['bandwidth'],
                'Location': connection['location'],
                'Vlan': connection.get('vlan', 'N/A')  # Some connections might not have a VLAN
            }
            direct_connect_connections_list.append(connection_details)

        return direct_connect_connections_list

    except ClientError as e:
        print(f"An error occurred while fetching Direct Connect connections: {e}")
        return None

# --------------------------------------------------------------------

# Containers
def list_ecs_clusters_and_services():
    ecs = boto3.client('ecs')
    
    # Pagination handling for clusters
    clusters = []
    next_token = None
    while True:
        if next_token:
            response = ecs.list_clusters(nextToken=next_token)
        else:
            response = ecs.list_clusters()
        clusters.extend(response['clusterArns'])
        
        next_token = response.get('nextToken')
        if not next_token:
            break

    cluster_services = {}
    for cluster in clusters:
        services = []
        
        # Pagination handling for services
        next_token = None
        while True:
            if next_token:
                service_response = ecs.list_services(cluster=cluster, nextToken=next_token)
            else:
                service_response = ecs.list_services(cluster=cluster)
                
            services.extend(service_response['serviceArns'])
            
            next_token = service_response.get('nextToken')
            if not next_token:
                break

        cluster_services[cluster] = services

    return cluster_services

# --------------------------------------------------------------------
# Security, Identity, & Compliance
def list_iam_users():
    iam = boto3.client('iam')
    
    users = []
    marker = None
    while True:
        if marker:
            response = iam.list_users(Marker=marker)
        else:
            response = iam.list_users()
        
        users.extend([user['UserName'] for user in response['Users']])
        
        if response['IsTruncated']:  # Check if there are more users to be fetched
            marker = response['Marker']
        else:
            break

    return users

# --------------------------------------------------------------------

#  Fetch IAM roles and associated policies.
def list_iam_roles_policies():
    iam = boto3.client('iam')
    
    roles = []
    marker_roles = None
    while True:
        if marker_roles:
            roles_response = iam.list_roles(Marker=marker_roles)
        else:
            roles_response = iam.list_roles()

        roles.extend(roles_response['Roles'])

        if roles_response['IsTruncated']:
            marker_roles = roles_response['Marker']
        else:
            break

    role_policies = {}
    for role in roles:
        role_name = role['RoleName']
        policies = []

        marker_policies = None
        while True:
            if marker_policies:
                policies_response = iam.list_attached_role_policies(RoleName=role_name, Marker=marker_policies)
            else:
                policies_response = iam.list_attached_role_policies(RoleName=role_name)

            policies.extend([policy['PolicyName'] for policy in policies_response['AttachedPolicies']])

            if policies_response['IsTruncated']:
                marker_policies = policies_response['Marker']
            else:
                break

        role_policies[role_name] = policies

    return role_policies

# --------------------------------------------------------------------
# Management & Monitoring
def list_cloudwatch_alarms():
    cw = boto3.client('cloudwatch')

    alarms = []
    next_token = None

    try:
        while True:
            if next_token:
                response = cw.describe_alarms(NextToken=next_token)
            else:
                response = cw.describe_alarms()

            alarms.extend([alarm['AlarmName'] for alarm in response['MetricAlarms']])
            
            next_token = response.get('NextToken')
            if not next_token:
                break

        return alarms

    except Exception as e:
        print(f"Error listing CloudWatch alarms: {e}")
        return None

# --------------------------------------------------------------------
# Developer Tools
def list_api_gateway_apis():
    ag = boto3.client('apigateway')
    apis = []
    position = None

    try:
        while True:
            if position:
                response = ag.get_rest_apis(position=position)
            else:
                response = ag.get_rest_apis()

            apis.extend([api['name'] for api in response['items']])
            
            position = response.get('position')
            if not position or not response.get('items'):
                break

        return apis

    except Exception as e:
        print(f"Error listing API Gateway APIs: {e}")
        return None


# ... Menu functions and Menu driver ...
# ----------------------------------------------------------
def main_menu():
    print("\nMain Menu:")
    print("1. Compute")
    print("2. Storage")
    print("3. Database")
    print("4. Network")
    print("5. Containers")
    print("6. Security")
    print("7. Monitor")
    print("8. Development")
    print("9. Exit")

# --------------------------------------------------------------------
def compute_menu():
    print("\nCompute Menu:")
    print("1. List EC2 Instances")
    print("2. List Lambda Functions")
    print("3. List Elastic Beanstalk Apps Environments")
    print("x. Back to main menu")

# --------------------------------------------------------------------
def storage_menu():
    print("\nStorage Menu:")
    print("1. List Public S3 Buckets")
    print("2. List S3 Bucket Permissions")
    print("3. List Dynamodb Tables")
    print("4. List EBS Volumes")
    print("x. Back to main menu")

# --------------------------------------------------------------------
def database_menu():
    print("\nDatabase Menu:")
    print("1. List RDS Instances")
    print("x. Back to main menu")

# --------------------------------------------------------------------
# Networking & Content Delivery
def network_menu():
    print("\nNetwork Menu:")
    print("1. List VPCs & Subnets")
    print("2. List Security Groups & Rules ")
    print("3. List Elastic Load Balancers")
    print("4. List Cloudfront Distributions")
    print("5. List Route53 Zones Records")
    print("6. List VPC Peering Connections")
    print("7. List Direct Connect Connections")
    print("x. Back to main menu")


# --------------------------------------------------------------------
def containers_menu():
    print("\nContainers Menu:")
    print("1. List ECS Clusters & Services")
    print("x. Back to main menu")

# --------------------------------------------------------------------
def security_menu():
    print("\nSecurity Menu:")
    print("1. List IAM Users")
    print("2. List IAM Roles Policies")
    print("x. Back to main menu")

# --------------------------------------------------------------------
def monitor_menu():
    print("\nMonitoring Menu:")
    print("1. List Cloudwatch Alarms")
    print("x. Back to main menu")

# --------------------------------------------------------------------
def development_menu():
    print("\nDevelopment Menu:")
    print("1. List API Gateway APIs")
    print("x. Back to main menu")


# --------------------------------------------------------------------
# === Menu Driver Function ===

def menu_driver():
    while True:
        main_menu()
        main_choice = input("\nChoose a category: ")

# --------------------------------------------------------------------

# Compute
        if main_choice == "1":
            while True:
                compute_menu()
                compute_choice = input("\nEnter choice: ")

                if compute_choice == "1":
                  try:
                      for instance in list_ec2_instances():
                          print(instance)
                  except Exception as e:
                      print(f"An error occurred: {e}")
                elif compute_choice == "2":
                  try:  
                      for function in list_lambda_functions():
                          print(function)
                  except Exception as e:
                      print(f"An error occurred: {e}")
                elif compute_choice == "3":
                  try:  
                      for env in list_elastic_beanstalk_apps_environments():
                          print(env)
                  except Exception as e:
                      print(f"An error occurred: {e}")
                elif compute_choice.lower() == "x":
                    break
                else:
                    print("Invalid choice. Please select a valid option.")


# --------------------------------------------------------------------

# Storage
        elif main_choice == "2":  # Storage
            while True:
                storage_menu()
                storage_choice = input("\nEnter choice: ")

                if storage_choice == "1":
                  try:
                      for bucket in list_public_s3_buckets():
                            print(bucket)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif storage_choice == "2":
                  try:
                      for function in list_s3_bucket_acl():
                            print(function)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif storage_choice == "3":
                  try:
                    for env in list_dynamodb_tables():
                        print(env)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif storage_choice == "4":
                  try:
                    for volume in list_ebs_volumes():
                        print(volume)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif storage_choice.lower() == "x":
                    break
                else:
                    print("Invalid choice. Please select a valid option.")

# --------------------------------------------------------------------

# Database
        elif main_choice == "3":
            while True:
                database_menu()
                db_choice = input("\nEnter choice: ")

                if db_choice == "1":
                  try:
                    for instance in list_rds_instances():
                        print(instance)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif db_choice.lower() == "x":
                    break
                else:
                    print("Invalid choice. Please select a valid option.")


# --------------------------------------------------------------------
# Network
        elif main_choice == "4":
            while True:
                network_menu()
                network_choice = input("\nEnter choice: ")

                if network_choice == "1":
                  try:
                    for network in list_vpcs_and_subnets():
                        print(network)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif network_choice == "2":
                  try:
                    for group in list_security_groups_and_rules():
                        print(group)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif network_choice == "3":
                  try:
                    for balancer in list_elastic_load_balancers():
                        print(balancer)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif network_choice == "4":
                  try:
                    for distro in list_cloudfront_distributions():
                        print(distro)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif network_choice == "5":
                  try:
                    for zone in list_route53_zones_records():
                        print(zone)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif network_choice == "6":
                  try:
                    for connection in list_vpc_peering_connections():
                        print(connection)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif network_choice == "7":
                  try:
                    for connection in list_direct_connect_connections():
                        print(connection)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif network_choice.lower() == "x":
                    break
                else:
                    print("Invalid choice. Please select a valid option.")

# --------------------------------------------------------------------

    # Containers
        elif main_choice == "5":
            while True:
                containers_menu()
                container_choice = input("\nEnter choice: ")

                if container_choice == "1":
                  try:
                    for container in list_ecs_clusters_and_services():
                        print(container)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif container_choice.lower() == "x":
                    break
                else:
                    print("Invalid choice. Please select a valid option.")

# --------------------------------------------------------------------
    # Security
        elif main_choice == "6":
            while True:
                security_menu()
                security_choice = input("\nEnter choice: ")

                if security_choice == "1":
                  try:
                    for user in list_iam_users():
                        print(user)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif security_choice == "2":
                  try:
                    for roles in list_iam_roles_policies():
                        print(roles)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif security_choice.lower() == "x":
                    break
                else:
                    print("Invalid choice. Please select a valid option.")

# --------------------------------------------------------------------
    # Monitor
        elif main_choice == "7":
            while True:
                monitor_menu()
                monitor_choice = input("\nEnter choice: ")

                if monitor_choice == "1":
                  try:
                    for alarm in list_cloudwatch_alarms():
                        print(alarm)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif monitor_choice.lower() == "x":
                    break
                else:
                    print("Invalid choice. Please select a valid option.")

# --------------------------------------------------------------------
    # Development
        elif main_choice == "8":  # Development
            while True:
                development_menu()
                development_choice = input("\nEnter choice: ")

                if development_choice == "1":
                  try:
                    for API in list_api_gateway_apis():
                        print(API)
                  except Exception as e:
                        print(f"An error occurred: {e}")
                elif development_choice.lower() == "x":
                    break
                else:
                    print("Invalid choice. Please select a valid option.")

        elif main_choice == "x":
            print("Exiting...")
            break

        else:
            print("Invalid choice. Please select a valid category.")

# === Main Execution ===

if __name__ == '__main__':
    menu_driver()
