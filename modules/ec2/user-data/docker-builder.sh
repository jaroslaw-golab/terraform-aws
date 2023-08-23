#!/bin/bash
#install docker image builder ubuntu 20 (t2.xlarge, 100G)
sudo apt update
sudo apt upgrade -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker ubuntu
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip -y
unzip awscliv2.zip
sudo ./aws/install
sudo apt-get install -y default-jre git
#for aws sdk
sudo apt install -y python3
sudo apt install -y python3-pip
sudo apt install -y awscli
pip3 install awscli --upgrade --user
mkdir -p /home/ubuntu/workspace/
sudo chown ubunu:ubuntu /home/ubuntu/workspace/*
#copy DB pem file to /home/ubuntu/workspace
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEC2S15oIwezwqBfk+csfMqJAPF4UStiiF818KcH5RPfB6w42uMl0pmqeLdcy33hxS4FJwUlncluFTXYYj0oSeWfqpRw9Jkv8haeUDXCQo7jsb706Jb6/mzIox62G5S9nR9P7gi4EcnENF0zO+uuSINPf4REGnAq3l41EUNul6XP/8wo2F4asoEjvXapQUDBG75HCNUPtrPbFXqEpN5BYIwvL9AM4OomstUtykJSYd/a/cTHHZbH0L4SU0NfkY0OiVsmY4coOcZyhuZ+2AtaKhZPiHm1mrKcc5LGZRXcl3yKt4sYtfTyqfLH9PGdgGyU9Ke5OZ7eiwrtLIU7McyWAQUU3L3kmnDzSPCoSlsy5+CqcUYk0GN0jHnYIo1vm/aMJyIwfFb0nuH5MqML9Rg+J9G3X2n4e+8gs1SCQw7hhKKvxlB9nAetmftvteg24QQYxYxQADx49XhKN/ZacZ7m9ZZNWi67nfyKTR5uVLm6fwiFtipJ+qKE7+IbpYHfSj0xk= ubuntu@ip-172-35-31-67' >> /home/ubuntu/.ssh/authorized_keys
wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem -P /home/ubuntu/workspace
aws s3 sync s3://661341420438-models-data/python-update/ /home/ubuntu/workspace/vectors_files_3_10/ 
mkdir -p vectors
cp -R /home/ubuntu/workspace/vectors_files_3_10/ vectors