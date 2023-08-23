data "aws_lb_listener" "verify-prod" {
  arn = "arn:aws:elasticloadbalancing:us-east-1:931929721969:listener/app/verify-pf-prod/e65e53664f84a3eb/075a75102ba36e27"
}

module "verify-sb" {
    source = "../../../modules/ec2"

    project = var.project
    tag_stage = "dev"
    environment = "sb"
  

    # instance variables

    #image = "ami-04505e74c0741db8d"
    instance_type = "t3.medium"
    tag_name = "Verify-${var.project}-sb-Ubuntu-22"
    key_name = "beaconcure_prpd_key"
    subnet_id = "subnet-bd543f93"
    instance_profile = "beacon_app_server"
    security_group = "sg-0c17676e3c1dba60c"
    user_data = file("../../../modules/ec2/user-data/sb-userdata.sh")
    public_ip = false
    # target-group variables

    vpc-id = "vpc-fcf54d86"
    target_group_name = "verify-sb-tg"

    # loadbalancer variables

   # listener_arn = "arn:aws:elasticloadbalancing:us-east-1:931929721969:listener/app/verify-pf-prod/e65e53664f84a3eb/075a75102ba36e27"

  
}

module "verify-tr" {
    source = "../../../modules/ec2"

    project = var.project
    tag_stage = "skip"
    environment = "training"
   
    # instance variables

    #image = "ami-04505e74c0741db8d"
    instance_type = "t3.medium"
    tag_name = "Verify-${var.project}-training-Ubuntu-22"
    key_name = "beaconcure_prpd_key"
    subnet_id = "subnet-bd543f93"
    instance_profile = "beacon_app_server"
    public_ip = false
    security_group = "sg-0c17676e3c1dba60c"
    user_data = file("../../../modules/ec2/user-data/tr-userdata.sh")

    # target-group variables

    vpc-id = "vpc-fcf54d86"
    target_group_name = "verify-tr-tg"

    # loadbalancer variables

    #listener_arn = "arn:aws:elasticloadbalancing:us-east-1:931929721969:listener/app/verify-pf-prod/e65e53664f84a3eb/075a75102ba36e27"

  
}