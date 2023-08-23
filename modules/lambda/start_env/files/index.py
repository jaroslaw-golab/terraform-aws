import boto3

def lambda_handler(event, context):
    
    ec2_client = boto3.client('ec2')
    documentdb_client = boto3.client('docdb')
    
    
    response = ec2_client.describe_instances()
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            ec2_client.start_instances(InstanceIds=[instance_id])
    
    
    response = documentdb_client.describe_db_clusters()
    for cluster in response['DBClusters']:
        cluster_id = cluster['DBClusterIdentifier']
        documentdb_client.start_db_cluster(DBClusterIdentifier=cluster_id)

    return "All resources has been starting."
