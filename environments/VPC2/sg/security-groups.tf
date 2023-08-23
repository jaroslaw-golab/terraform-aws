 


  # aws_security_group.analytics-server must be replaced
resource "aws_security_group" "analytics-server" {
      
      description            = "analytics server sg ubuntu20"
     
    }

  # aws_security_group.analytics-server-SB must be replaced
resource "aws_security_group" "analytics-server-SB" {

      description            = "analytics server SB"
      
    }

  # aws_security_group.app_server_sg must be replaced
resource "aws_security_group" "app_server_sg" {
     
      description            = "app-server" 
    
    }

  # aws_security_group.batch-sg must be replaced
resource "aws_security_group" "batch-sg" {
     
      description            = "awsBatchEventHandler" 
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
      name                   = "awsBatchEventHandler" 
      
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "awsBatchEventHandler"
        }
       
      vpc_id                 = "vpc-02377211ce72baae9" 
    }

  # aws_security_group.db_server must be replaced
resource "aws_security_group" "db_server" {
    
      description            = "DB-server-vpc5" 
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
              description      = "AWS vpn"
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
              description      = ""
              from_port        = 27017
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-04edf9d19e4af3b48",
                  "sg-07c6cad969cc4d868",
                ]
              self             = false
              to_port          = 27017
            },
        ] 
      name                   = "DB-server-vpc5" 
     
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "DB-server-vpc5"
        }
      
      vpc_id                 = "vpc-02377211ce72baae9" 
    }

  # aws_security_group.docker must be replaced
resource "aws_security_group" "docker" {
     
      description            = "docker-image-builder-vpc5" 
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
              description      = "AWS vpn"
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
                  "sg-067642b79dcbd1637",
                ]
              self             = false
              to_port          = 22
            },
        ] 
      name                   = "docker-image-builder-vpc5" 
     
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "docker-image-builder-vpc5"
        }
     
      vpc_id                 = "vpc-02377211ce72baae9" 
    }

  # aws_security_group.jenkins-master must be replaced
resource "aws_security_group" "jenkins-master" {
      
      description            = "jenkins-master-vpc5" 
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
              description      = "AWS vpn"
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
              description      = "AWS vpn"
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
              description      = "pf-sb-loadbalancer"
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-052e23beace163c2b",
                ]
              self             = false
              to_port          = 80
            },
        ] 
      name                   = "jenkins-master-vpc5" 
     
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "jenkins-master-vpc5"
        }
     
      vpc_id                 = "vpc-02377211ce72baae9" 
    }

  # aws_security_group.processing-sg must be replaced
resource "aws_security_group" "processing-sg" {
     
      description            = "batch-process" 
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
      name                   = "batch-process" 
      
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "batch-process"
        }
      
      vpc_id                 = "vpc-02377211ce72baae9" 
    }

resource "aws_security_group" "services-server-vpc5" {
     
      description            = "services-server-vpc5" 
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
              description      = "AWS vpn"
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
                  "sg-067642b79dcbd1637",
                ]
              self             = false
              to_port          = 22
            },
          {
              cidr_blocks      = []
              description      = ""
              from_port        = 80
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = [
                  "sg-07c6cad969cc4d868",
                ]
              self             = false
              to_port          = 80
            },
        ] 
        name                   = "services-server-vpc5"
   
      revoke_rules_on_delete = false
        tags                   = {
            "Name" = "services-server-vpc5"
        }
      vpc_id                 = "vpc-02377211ce72baae9" 
       
    }


  # aws_security_group.verify_load_balancer_sg must be replaced
resource "aws_security_group" "verify_load_balancer_sg" {
      
      description            = "verify-pf-sb-load-balancer" 
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
              description      = "office"
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
                  "162.48.192.69/32",
                ]
              description      = "Pfizer Dashboard Server"
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
                  "192.168.252.0/23",
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
              description      = "Pfizer Australia "
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
              description      = "Jarek"
              from_port        = 443
              ipv6_cidr_blocks = []
              prefix_list_ids  = []
              protocol         = "tcp"
              security_groups  = []
              self             = false
              to_port          = 443
            },
        ] 
      name                   = "verify-pf-sb-load-balancer" 
     
      revoke_rules_on_delete = false
      tags                   = {
          "Name" = "verify-pf-sb-load-balancer"
        }
     
      vpc_id                 = "vpc-02377211ce72baae9" 
    }