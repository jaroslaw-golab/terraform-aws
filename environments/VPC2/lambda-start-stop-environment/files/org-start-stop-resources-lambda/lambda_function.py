import boto3

def get_ec2_instances(account_id, assumed_role_credentials):
    ec2_assumed_client = boto3.client(
        'ec2',
        aws_access_key_id=assumed_role_credentials['AccessKeyId'],
        aws_secret_access_key=assumed_role_credentials['SecretAccessKey'],
        aws_session_token=assumed_role_credentials['SessionToken']
    )

    response = ec2_assumed_client.describe_instances()
    instances = []

    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            instance_name = None
            stage_tag_value = None

            if 'Tags' in instance:
                for tag in instance['Tags']:
                    if tag['Key'] == 'Name':
                        instance_name = tag['Value']
                    # elif tag['Key'] == 'Stage' and tag['Value'] == 'Dev':
                    #     stage_tag_value = tag['Value']

            instance_state = instance['State']['Name']
            instances.append({
                'InstanceId': instance_id,
                'InstanceName': instance_name,
                'InstanceState': instance_state,
                'AccountID': account_id,
                'StageTagValue': stage_tag_value
            })

    return instances

def get_documentdb_clusters(account_id, assumed_role_credentials):
    documentdb_assumed_client = boto3.client(
        'docdb',
        aws_access_key_id=assumed_role_credentials['AccessKeyId'],
        aws_secret_access_key=assumed_role_credentials['SecretAccessKey'],
        aws_session_token=assumed_role_credentials['SessionToken']
    )

    response = documentdb_assumed_client.describe_db_clusters()
    clusters = []

    for cluster in response['DBClusters']:
        cluster_id = cluster['DBClusterIdentifier']
        cluster_state = cluster['Status']
        stage_tag_value = None

        if 'Tags' in cluster:
            for tag in cluster['Tags']:
                if tag['Key'] == 'Stage' and tag['Value'] == 'Dev':
                    stage_tag_value = tag['Value']

        clusters.append({
            'ClusterId': cluster_id,
            'ClusterState': cluster_state,
            'AccountID': account_id,
            'StageTagValue': stage_tag_value
        })

    return clusters

def stop_ec2_instances(instances):
    ec2_client = boto3.client('ec2')

    instance_ids = [instance['InstanceId'] for instance in instances]

    if instance_ids:
        response = ec2_client.stop_instances(InstanceIds=instance_ids)
        stopping_instances = response.get('StoppingInstances', [])

        if stopping_instances:
            print("Stopped EC2 instances:")
            for instance in stopping_instances:
                print(f"Instance ID: {instance['InstanceId']}")
            print("-------------------")
        else:
            print("No EC2 instances were stopped.")

def stop_documentdb_clusters(clusters):
    documentdb_client = boto3.client('docdb')

    cluster_ids = [cluster['ClusterId'] for cluster in clusters]

    if cluster_ids:
        response = documentdb_client.stop_db_cluster(ClusterIdentifier=cluster_ids[0])
        cluster_status = response.get('DBCluster', {}).get('Status')

        if cluster_status == 'stopped':
            print("Stopped DocumentDB clusters:")
            for cluster_id in cluster_ids:
                print(f"Cluster ID: {cluster_id}")
            print("-------------------")
        else:
            print("No DocumentDB clusters were stopped.")

def lambda_handler(event, context):
    # Initialize AWS Organizations client
    organizations_client = boto3.client('organizations')
    sts_client = boto3.client('sts')

    # Retrieve the list of accounts in the organization
    accounts = organizations_client.list_accounts()

    # Process the list of accounts
    for account in accounts['Accounts']:
        account_id = account['Id']
        account_name = account['Name']

        # Generate the Role ARN based on the current account ID
        role_arn = f"arn:aws:iam::{account_id}:role/OrganizationAccountAccessRole"
        print(role_arn)
        try:
            # Assume the role
            response = sts_client.assume_role(
                RoleArn=role_arn,
                RoleSessionName='AssumeRoleSession'
            )
            # Retrieve the assumed role credentials
            assumed_role_credentials = response['Credentials']

            # Print logged-in accounts
            print("Logged-in Account:")
            print(f"Account ID: {account_id}")
            print(f"Account Name: {account_name}")
            print("-------------------")

            # Get EC2 instances
            instances = get_ec2_instances(account_id, assumed_role_credentials)

            # Get DocumentDB clusters
            clusters = get_documentdb_clusters(account_id, assumed_role_credentials)

            # Stop EC2 instances with 'stage=dev' tag
            dev_instances = [instance for instance in instances if instance['StageTagValue'] == 'Dev']
            stop_ec2_instances(dev_instances)

            # Wyświetl EC2 instances z tagiem Stage=Dev
            print("EC2 Instances with Stage=Dev tag:")
            for instance in dev_instances:
                print(f"Instance ID: {instance['InstanceId']}")
                print(f"Instance Name: {instance['InstanceName']}")
                print(f"Instance State: {instance['InstanceState']}")
                print(f"Stage Tag Value: {instance['StageTagValue']}")
                print("-------------------")

            # Stop DocumentDB clusters with 'stage=dev' tag
            dev_clusters = [cluster for cluster in clusters if cluster['StageTagValue'] == 'Dev']
            stop_documentdb_clusters(dev_clusters)

            # Wyświetl DocumentDB clusters z tagiem Stage=Dev
            print("DocumentDB Clusters with Stage=Dev tag:")
            for cluster in dev_clusters:
                print(f"Cluster ID: {cluster['ClusterId']}")
                print(f"Cluster State: {cluster['ClusterState']}")
                print(f"Stage Tag Value: {cluster['StageTagValue']}")
                print("-------------------")

            # Print instances
            print(f"EC2 Instances (Account ID: {account_id}):")
            for instance in instances:
                print(f"Instance ID: {instance['InstanceId']}")
                print(f"Instance Name: {instance['InstanceName']}")
                print(f"Instance State: {instance['InstanceState']}")
                print(f"Stage Tag Value: {instance['StageTagValue']}")
                print("-------------------")

            # Print clusters
            print(f"DocumentDB Clusters (Account ID: {account_id}):")
            for cluster in clusters:
                print(f"Cluster ID: {cluster['ClusterId']}")
                print(f"Cluster State: {cluster['ClusterState']}")
                print(f"Stage Tag Value: {cluster['StageTagValue']}")
                print("-------------------")

        except sts_client.exceptions.ClientError as e:
            error_code = e.response['Error']['Code']
            error_message = e.response['Error']['Message']

            # Print failed login attempt
            print("Failed to log in to the account:")
            print(f"Account ID: {account_id}")
            print(f"Account Name: {account_name}")
            print(f"Error Code: {error_code}")
            print(f"Error Message: {error_message}")
            print("-------------------")

# Entry point for the Lambda function
lambda_handler(None, None)
