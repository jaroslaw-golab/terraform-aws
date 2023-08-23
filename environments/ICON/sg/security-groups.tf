  # aws_security_group.app_db_sg must be replaced
resource "aws_security_group" "app_db_sg" {
      
       description            = "SecurityGroup for Database" 
       egress                 = [
          {
              cidr_blocks      = [
                  "0.0.0.0/0",
                ]
              description      = ""
              from_port        = 0
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "-1"
              security_groups  = []
              self             = false
              to_port          = 0
            },
        ] 
       
       ingress                = [
          {
              cidr_blocks      = [
                  "192.168.252.0/23",
                ]
              description      = "aws-vpn"
              from_port        = 27017
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 27017
            },
          
          {
              cidr_blocks      = []
              description      = "application"
              from_port        = 27017
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0a0400d1ae81916a9",
                ]
              self             = false
              to_port          = 27017
            },
          
          {
              cidr_blocks      = []
              description      = "batch"
              from_port        = 27017
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0cfa3dbe6dca1458f",
                ]
              self             = false
              to_port          = 27017
            },
        ] 
        name                   = "icon-database-sg"
      revoke_rules_on_delete = false
        tags                   = {
            "Component" = "network"
            "Name"      = "icon-database-sg"
            "Project"   = "environments"
            "Stage"     = "dev"
        }
       vpc_id                 = "vpc-02e121e736e685db7" 
        # (1 unchanged attribute hidden)
    }

  # aws_security_group.app_server_sg must be replaced
resource "aws_security_group" "app_server_sg" {
      
       description            = "SecurityGroup for Verify App" 
       egress                 = [
          {
              cidr_blocks      = [
                  "0.0.0.0/0",
                ]
              description      = ""
              from_port        = 0
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "-1"
              security_groups  = []
              self             = false
              to_port          = 0
            },
        ] 
      
       ingress                = [
          {
              cidr_blocks      = [
                  "172.16.1.24/32",
                ]
              description      = "build.beaconcure.com"
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 22
            },
          {
              cidr_blocks      = [
                  "172.16.13.202/32",
                ]
              description      = "zabbix-server"
              from_port        = 10050
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 10050
            },
          {
              cidr_blocks      = [
                  "192.168.252.0/23",
                ]
              description      = "aws-vpn"
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 22
            },
          {
              cidr_blocks      = [
                  "192.168.252.0/23",
                ]
              description      = "aws-vpn"
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 80
            },
          {
              cidr_blocks      = []
              description      = "BatchSecurityGroup"
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0cfa3dbe6dca1458f",
                ]
              self             = false
              to_port          = 80
            },
          {
              cidr_blocks      = []
              description      = "Verify-Load-balancer"
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-06b77cc82bc4ea731",
                ]
              self             = false
              to_port          = 80
            },
        ] 
        name                   = "icon-application-sg"
      revoke_rules_on_delete = false
        tags                   = {
            "Component" = "network"
            "Name"      = "icon-application-sg"
            "Project"   = "environments"
            "Stage"     = "dev"
        }
       vpc_id                 = "vpc-02e121e736e685db7" 
       
    }

  # aws_security_group.batch-sg must be replaced
resource "aws_security_group" "batch-sg" {
       
       description            = "SecurityGroup for Batch" 
       egress                 = [
          {
              cidr_blocks      = [
                  "0.0.0.0/0",
                ]
              description      = ""
              from_port        = 0
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "-1"
              security_groups  = []
              self             = false
              to_port          = 0
            },
        ] 
      
       ingress                = [
          {
              cidr_blocks      = [
                  "192.168.252.0/23",
                ]
              description      = "aws-vpn"
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 22
            },
        ] 
        name                   = "batch-sg"
      
      revoke_rules_on_delete = false
        tags                   = {
            "Component" = "network"
            "Name"      = "batch-sg"
            "Project"   = "environments"
            "Stage"     = "dev"
        }
       vpc_id                 = "vpc-02e121e736e685db7" 
        # (1 unchanged attribute hidden)
    }

  # aws_security_group.processing-sg must be replaced
resource "aws_security_group" "processing-sg" {
       
       description            = "SecurityGroup for Processing EC2" 
       egress                 = [
          {
              cidr_blocks      = [
                  "0.0.0.0/0",
                ]
              description      = ""
              from_port        = 0
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "-1"
              security_groups  = []
              self             = false
              to_port          = 0
            },
        ] 
       
       ingress                = [
          {
              cidr_blocks      = [
                  "192.168.252.0/23",
                ]
              description      = "aws-vpn"
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 22
            },
        ] 
        name                   = "processing-sg"
      
      revoke_rules_on_delete = false
        tags                   = {
            "Component" = "network"
            "Name"      = "processing-sg"
            "Project"   = "environments"
            "Stage"     = "dev"
        }
       vpc_id                 = "vpc-02e121e736e685db7" 
        # (1 unchanged attribute hidden)
    }

  # aws_security_group.verify_load_balancer_sg must be replaced
resource "aws_security_group" "verify_load_balancer_sg" {
        
       description            = "SecurityGroup for Alb" 
       egress                 = [
          {
              cidr_blocks      = [
                  "0.0.0.0/0",
                ]
              description      = ""
              from_port        = 0
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "-1"
              security_groups  = []
              self             = false
              to_port          = 0
            },
        ] 
       
       ingress                = [
          {
              cidr_blocks      = [
                  "147.235.27.218/32",
                ]
              description      = "beaconcure-office"
              from_port        = 443
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 443
            },
          {
              cidr_blocks      = [
                  "192.168.252.0/23",
                ]
              description      = "aws-vpn"
              from_port        = 443
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 443
            },
          {
              cidr_blocks      = [
                  "3.227.45.172/32",
                ]
              description      = "nat-gateway"
              from_port        = 443
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 443
            },
          {
              cidr_blocks      = [
                  "54.210.40.244/32",
                ]
              description      = "Local Net Gateway"
              from_port        = 443
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 443
            },
          {
              cidr_blocks      = [
                  "85.89.185.156/32",
                ]
              description      = "jarek-office"
              from_port        = 443
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 443
            },
        ] 
        name                   = "icon-alb-sg"
    
      revoke_rules_on_delete = false
        tags                   = {
            "Component" = "network"
            "Name"      = "icon-alb-sg"
            "Project"   = "environments"
            "Stage"     = "dev"
        }
       vpc_id                 = "vpc-02e121e736e685db7" 
        # (1 unchanged attribute hidden)
    }