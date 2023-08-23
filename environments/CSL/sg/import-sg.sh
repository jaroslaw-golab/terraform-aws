#!/bin/bash

# Pobierz listę grup zabezpieczeń z AWS CLI
security_groups=$(aws ec2 describe-security-groups --query "SecurityGroups[].GroupId" --output text)

# Pętla dla każdej grupy zabezpieczeń
for sg_id in $security_groups; do
  # Wykonaj import dla grupy zabezpieczeń w Terraform
  terraform import -var "security_group_id=${sg_id}" aws_security_group.example
done
