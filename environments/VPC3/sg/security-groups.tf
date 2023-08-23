
  # aws_security_group.analytics-server must be replaced
resource "aws_security_group" "analytics-server" {
      
      description            = "analytics-prod" 
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
              description      = "AWS VPN"
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
              description      = "AWS VPN"
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
                  "sg-074e7aec4354138ff",
                ]
              self             = false
              to_port          = 80
            },
        ] 
      name                   = "analytics-prod" 
     
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "analytics-prod"
        } 
     
      vpc_id                 = "vpc-fcf54d86" 
    }

  # aws_security_group.app_server_sg must be replaced
resource "aws_security_group" "app_server_sg" {
    
      description            = "customerApp-prod"
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
              description      = ""
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-074e7aec4354138ff",
                ]
              self             = false
              to_port          = 80
            },
          {
              cidr_blocks      = [
                  "192.168.252.0/23",
                ]
              description      = "AWS VPN"
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
                  "85.89.185.156/32",
                ]
              description      = ""
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0d91d78496faf8ab0",
                ]
              self             = false
              to_port          = 22
            },
          {
              cidr_blocks      = []
              description      = "HTTP from lambda"
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-08e79ab62c1891c05",
                ]
              self             = false
              to_port          = 80
            },
          {
              cidr_blocks      = []
              description      = "HTTPS load balancer"
              from_port        = 443
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-074e7aec4354138ff",
                ]
              self             = false
              to_port          = 443
            },
        ] 
      name                   = "customerApp-prod" 
     
      tags                   = {
          "Name" = "Verify App prod"
        } 
      
      vpc_id                 = "vpc-fcf54d86" 
    }

  # aws_security_group.batch-sg must be replaced
resource "aws_security_group" "batch-sg" {
      
      description            = "Batch SG" 
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
      
      ingress                = [] 
      name                   = "Batch SG" 
      
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "Batch SG"
        } 
      
      vpc_id                 = "vpc-fcf54d86" 
    }

  # aws_security_group.db_server must be replaced
resource "aws_security_group" "db_server" {
     
      description            = "customerApp-prod" 
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
              description      = ""
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-074e7aec4354138ff",
                ]
              self             = false
              to_port          = 80
            },
          {
              cidr_blocks      = [
                  "192.168.252.0/23",
                ]
              description      = "AWS VPN"
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
                  "85.89.185.156/32",
                ]
              description      = ""
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0d91d78496faf8ab0",
                ]
              self             = false
              to_port          = 22
            },
          {
              cidr_blocks      = []
              description      = "HTTP from lambda"
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-08e79ab62c1891c05",
                ]
              self             = false
              to_port          = 80
            },
          {
              cidr_blocks      = []
              description      = "HTTPS load balancer"
              from_port        = 443
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-074e7aec4354138ff",
                ]
              self             = false
              to_port          = 443
            },
        ] 
      name                   = "customerApp-prod" 
      
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "Verify App prod"
        } 
      
      vpc_id                 = "vpc-fcf54d86" 
    }

  # aws_security_group.docker must be replaced
resource "aws_security_group" "docker" {
     
      description            = "DockerImageBuilder"
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
              description      = "AWS VPN"
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 22
            },
          {
              cidr_blocks      = []
              description      = ""
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0d91d78496faf8ab0",
                ]
              self             = false
              to_port          = 22
            },
        ] 
      name                   = "DockerImageBuilder" 
     
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "DockerImageBuilder prod"
        } 
      
      vpc_id                 = "vpc-fcf54d86" 
    }

  # aws_security_group.jenkins-master must be replaced
resource "aws_security_group" "jenkins-master" {
   
      description            = "Jenkins_master_prod" 
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
              description      = "AWS VPN"
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
              description      = "AWS VPN"
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
              description      = "pf-loadbalancer"
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-074e7aec4354138ff",
                ]
              self             = false
              to_port          = 80
            },
        ] 
      name                   = "Jenkins_master_prod" 
      
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "Jenkins_master_prod"
        } 
      
      vpc_id                 = "vpc-fcf54d86" 
    }

  # aws_security_group.lambda must be replaced
resource "aws_security_group" "lambda" {
     
      description            = "lambdaBatchEventHandler" 
      egress                 = [
          {
              cidr_blocks      = [
                  "0.0.0.0/0",
                ]
              description      = ""
              from_port        = 0
              ipv6_cidr_blocks = [
                  "::/0",
                ]
              prefix_list_ids  = []
              protocol         = "-1"
              security_groups  = []
              self             = false
              to_port          = 0
            },
        ] 
      
      ingress                = [] 
      name                   = "lambdaBatchEventHandler" 
     
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "lambdaBatchEventHandler"
        } 
       
      vpc_id                 = "vpc-fcf54d86" 
    }

  # aws_security_group.processing-sg must be replaced
resource "aws_security_group" "processing-sg" {
      
      description            = "Jenkins_master_prod" 
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
              description      = "AWS VPN"
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
              description      = "AWS VPN"
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
              description      = "pf-loadbalancer"
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-074e7aec4354138ff",
                ]
              self             = false
              to_port          = 80
            },
        ] 
      name                   = "Jenkins_master_prod" 
     
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "Jenkins_master_prod"
        } 
     
      vpc_id                 = "vpc-fcf54d86" 
    }

  # aws_security_group.services-server-vpc5 must be replaced
resource "aws_security_group" "services-server-vpc5" {
     
      description            = "Service-prod" 
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
              description      = "AWS VPN"
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 22
            },
          {
              cidr_blocks      = []
              description      = ""
              from_port        = 22
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0d91d78496faf8ab0",
                ]
              self             = false
              to_port          = 22
            },
          {
              cidr_blocks      = []
              description      = "from batch"
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-0d2af2d52253972b1",
                ]
              self             = false
              to_port          = 80
            },
          {
              cidr_blocks      = []
              description      = "from docker builder"
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-07a526a3cd8ca9c5b",
                ]
              self             = false
              to_port          = 80
            },
        ] 
      name                   = "Service-prod" 
      
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "Service prod"
        } 
      
      vpc_id                 = "vpc-fcf54d86" 
    }

  # aws_security_group.verify_load_balancer_sg must be replaced
resource "aws_security_group" "verify_load_balancer_sg" {
     
      description            = "verify-pf-load-balancer" 
      egress                 = [
          {
              cidr_blocks      = [
                  "0.0.0.0/0",
                ]
              description      = ""
              from_port        = 0
              ipv6_cidr_blocks = [
                  "::/0",
                ]
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
                  "109.186.80.128/32",
                ]
              description      = "Naama"
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
                  "122.1.107.82/32",
                ]
              description      = "EPS clinical 1"
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
                  "122.1.107.83/32",
                ]
              description      = "EPS clinical 2"
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
                  "142.114.74.232/32",
                ]
              description      = "Keren home"
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
              description      = "Office"
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
                  "148.168.216.0/24",
                ]
              description      = "Pfizer California"
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
                  "148.168.40.0/24",
                ]
              description      = "Pfizer Virginia"
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
                  "148.168.96.0/24",
                ]
              description      = "Pfizer New Jersey"
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
                  "168.224.160.0/24",
                ]
              description      = "Pfizer Belgium"
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
                  "170.116.64.0/24",
                ]
              description      = "Pfizer Japan"
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
                  "192.168.255.0/24",
                ]
              description      = "Beaconcure VPN"
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
                  "192.168.68.100/32",
                ]
              description      = "Shani Home"
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
                  "204.114.176.0/24",
                ]
              description      = "Pfizer China"
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
                  "204.114.196.0/24",
                ]
              description      = "Pfizer Singapore"
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
                  "204.114.199.0/24",
                ]
              description      = "Pfizer Australia"
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
                  "213.57.145.106/32",
                ]
              description      = "Yehoshua"
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
                  "5.22.135.16/32",
                ]
              description      = "Liron"
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
                  "52.20.23.54/32",
                ]
              description      = "Pfizer nat gateway"
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
                  "72.138.254.188/32",
                ]
              description      = "Shani"
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
                  "84.229.211.143/32",
                ]
              description      = "Ilan"
              from_port        = 443
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 443
            },
        ] 
      name                   = "verify-pf-load-balancer" 
     
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "verify-pf-load-balancer"
        } 
      
      vpc_id                 = "vpc-fcf54d86" 
    }