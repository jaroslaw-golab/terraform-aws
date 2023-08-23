resource "aws_security_group" "verify_load_balancer_sg" {
      description            = "verify-load-balancer"
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
                  "10.0.0.0/22",
                ]
              description      = ""
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
                  "54.159.9.231/32",
                ]
              description      = "VPC 2 NAT GATEWAY (for connections from EC2 private IP)"
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
              description      = "jarek office"
              from_port        = 443
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 443
            },
          {
              cidr_blocks      = []
              description      = "csl-vpn"
              from_port        = 443
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-03debfd639e1b099f",
                ]
              self             = false
              to_port          = 443
            },
        ] 
      name                   = "verify-load-balancer"
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "verify load balancer_sg"
        } 
      tags_all               = {
          "Name" = "verify load balancer_sg"
        } 
      vpc_id                 = "vpc-02be59b20cebcdca8" 
    }


resource "aws_security_group" "app_server_sg" {
 
      description            = "App_server" 
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
              description      = "aws vpn"
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
              description      = "aws vpn"
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
              description      = ""
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-03debfd639e1b099f",
                ]
              self             = false
              to_port          = 80
            },
          {
              cidr_blocks      = []
              description      = "Verify load balancer "
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0c284ea89bfe14281",
                ]
              self             = false
              to_port          = 80
            },
          {
              cidr_blocks      = []
              description      = "csl vpn"
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-03debfd639e1b099f",
                ]
              self             = false
              to_port          = 22
            },
        ] 
      name                   = "App_server"
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "app_server_sg"
        } 
      tags_all               = {
          "Name" = "app_server_sg"
        } 
      vpc_id                 = "vpc-02be59b20cebcdca8" 
    
}
resource "aws_security_group" "app_db_sg" {
      description            = "app_db"  
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
                  "0.0.0.0/0",
                ]
              description      = ""
              from_port        = 27017
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 27017
            },
          {
              cidr_blocks      = [
                  "192.168.252.0/23",
                ]
              description      = "aws vpn"
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
              description      = "Docker builder"
              from_port        = 27017
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-07d0b00abbe54dcbf",
                ]
              self             = false
              to_port          = 27017
            },
          {
              cidr_blocks      = []
              description      = "Verify app"
              from_port        = 27017
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0bd5c225b5e8ae234",
                ]
              self             = false
              to_port          = 27017
            },
        ] 
      name                   = "app_db" 
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "app_db_sg"
        } 
      tags_all               = {
          "Name" = "app_db_sg"
        } 
      vpc_id                 = "vpc-02be59b20cebcdca8" 
    
}
resource "aws_security_group" "docker_builder_sg" {
   description            = "docker-builder"  
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
              description      = "aws vpn"
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 22
            },
        ] 
      name                   = "docker-builder" 
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "docker_builder_sg\t"
        } 
      tags_all               = {
          "Name" = "docker_builder_sg\t"
        } 
      vpc_id                 = "vpc-02be59b20cebcdca8" 
}

resource "aws_security_group" "jenkins-master_sg" {
  
      description            = "jenkins-master" 
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
              description      = "aws vpn"
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
              description      = "aws vpn"
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
              description      = "Verify app server"
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0bd5c225b5e8ae234",
                ]
              self             = false
              to_port          = 22
            },
          {
              cidr_blocks      = []
              description      = "Verify load balancer "
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0c284ea89bfe14281",
                ]
              self             = false
              to_port          = 80
            },
        ] 
      name                   = "jenkins-master"
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "jenkins-master_sg"
        } 
      tags_all               = {
          "Name" = "jenkins-master_sg"
        } 
      vpc_id                 = "vpc-02be59b20cebcdca8" 
}

resource "aws_security_group" "processing-sg" {
  
      description            = "SecurityGroup for Processing EC2"  # forces replacement
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
              description      = ""
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
      tags_all               = {
          "Component" = "network"
          "Name"      = "processing-sg"
          "Project"   = "environments"
          "Stage"     = "dev"
        } 
      vpc_id                 = "vpc-02be59b20cebcdca8" 
}

resource "aws_security_group" "vpn-sg" {
      description            = "VPN-sg" 
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
      tags                   = {} 
      tags_all               = {} 
      vpc_id                 = "vpc-02be59b20cebcdca8" 
}


