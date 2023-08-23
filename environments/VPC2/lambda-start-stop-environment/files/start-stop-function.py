import boto3

def lambda_handler(event, context):
    # Inicjalizacja klienta AWS
    iam_client = boto3.client('iam')
    ec2_client = boto3.client('ec2')
    docdb_client = boto3.client('docdb')

    # Pobranie listy wszystkich kont IAM
    accounts_response = iam_client.list_accounts()

    # Przypisanie konkretnej roli na wszystkich kontach
    role_name = 'MojaRola'
    for account in accounts_response['Accounts']:
        account_id = account['AccountId']
        try:
            # Przypisanie roli na konkretnym koncie
            response = iam_client.create_role(
                RoleName=role_name,
                AssumeRolePolicyDocument='''{
                    "Version": "2012-10-17",
                    "Statement": [
                        {
                            "Effect": "Allow",
                            "Principal": {
                                "AWS": "arn:aws:iam::{}:root"
                            },
                            "Action": "sts:AssumeRole"
                        }
                    ]
                }'''.format(account_id)
            )
            print('Rola {} została przypisana do konta {}'.format(role_name, account_id))
        except iam_client.exceptions.EntityAlreadyExistsException:
            print('Rola {} już istnieje na koncie {}'.format(role_name, account_id))
        except Exception as e:
            print('Błąd podczas przypisywania roli do konta {}: {}'.format(account_id, str(e)))

    # Pobranie wszystkich instancji EC2
    ec2_response = ec2_client.describe_instances()

    # Zatrzymywanie i uruchamianie konkretnej instancji EC2
    instance_id = 'i-1234567890abcdef0'  # ID konkretnej instancji
    for reservation in ec2_response['Reservations']:
        for instance in reservation['Instances']:
            if instance['InstanceId'] == instance_id:
                if instance['State']['Name'] == 'running':
                    # Zatrzymanie instancji
                    ec2_client.stop_instances(InstanceIds=[instance_id])
                    print('Instancja {} została zatrzymana'.format(instance_id))
                elif instance['State']['Name'] == 'stopped':
                    # Uruchomienie instancji
                    ec2_client.start_instances(InstanceIds=[instance_id])
                    print('Instancja {} została uruchomiona'.format(instance_id))

    # Pobranie wszystkich klastrów DocumentDB
    docdb_response = docdb_client.describe_db_clusters()

    # Zatrzymywanie i uruchamianie konkretnego klastra DocumentDB
    cluster_id = 'my-cluster'  # ID konkretnego klastra
    for cluster in docdb_response['DBClusters']:
        if cluster['DBClusterIdentifier'] == cluster_id:
            if cluster['Status'] == 'available':
                # Zatrzymanie klastra
                docdb_client.stop_db_cluster(DBClusterIdentifier=cluster_id)
                print('Klaster {} został zatrzymany'.format(cluster_id))
            elif cluster['Status'] == 'stopped':
                # Uruchomienie klastra
                docdb_client.start_db_cluster(DBClusterIdentifier=cluster_id)
                print('Klaster {} został uruchomiony'.format(cluster_id))
