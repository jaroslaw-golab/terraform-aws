import requests
import json

def send_slack_notification(webhook_url, message):
    data = {
        'text': message
    }
    headers = {
        'Content-Type': 'application/json'
    }
    response = requests.post(webhook_url, data=json.dumps(data), headers=headers)
    if response.status_code != 200:
        print(f"Failed to send Slack notification. Status code: {response.status_code}")

def start_db_cluster(docdb_client, cluster_identifier, webhook_url):
    try:
        # Kod rozpoczynający klaster DocumentDB

        # Wysyłanie powiadomienia na Slack
        message = f"Rozpoczęto klaster DocumentDB: {cluster_identifier}"
        send_slack_notification(webhook_url, message)

        # Pozostała część kodu

    except Exception as e:
        # Obsługa wyjątku
        pass

def stop_db_cluster(docdb_client, cluster_identifier, webhook_url):
    try:
        # Kod zatrzymujący klaster DocumentDB

        # Wysyłanie powiadomienia na Slack
        message = f"Zatrzymano klaster DocumentDB: {cluster_identifier}"
        send_slack_notification(webhook_url, message)

        # Pozostała część kodu

    except Exception as e:
        # Obsługa wyjątku
        pass

def lambda_handler(event, context):
    target_accounts = os.environ.get('TARGET_ACCOUNT').split(',')
    stage = os.environ.get('STAGE')
    status = os.environ.get('STATUS')
    resources = os.environ.get('RESOURCES')
    webhook_url = os.environ.get('SLACK_WEBHOOK_URL')  # Przykład zmiennej środowiskowej zawierającej webhook URL Slack

    # Pozostały kod

    if status.lower() == 'start':
        # Start EC2 instances
        for instance in ec2_instances:
            instance_id = instance['InstanceId']
            ec2_client.start_instances(InstanceIds=[instance_id])
            message = f"Uruchomiono instancję EC2: {instance_id}"
            send_slack_notification(webhook_url, message)

        # Check if DocumentDB clusters are running
        for cluster in filtered_docdb_clusters:
            cluster_identifier = cluster['DBClusterIdentifier']
            start_db_cluster(docdb_client, cluster_identifier, webhook_url)

    elif status.lower() == 'stop':
        # Stop EC2 instances
        for instance in ec2_instances:
            instance_id = instance['InstanceId']
            ec2_client.stop_instances(InstanceIds=[instance_id])
            message = f"Zatrzymano instancję EC2: {instance_id}"
            send_slack_notification(webhook_url, message)

        # Stop DocumentDB clusters
        for cluster in filtered_docdb_clusters:
            cluster_identifier = cluster['DBClusterIdentifier']
            stop_db_cluster(docdb_client, cluster_identifier, webhook_url)

    else:
        print("Unknown status. Allowed values are 'start' or 'stop'.")

    # Pozostały kod
