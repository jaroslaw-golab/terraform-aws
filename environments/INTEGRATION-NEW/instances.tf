# module "verify-prod-a" {
#     source = "../../modules/ec2"
#     environment = "prod"
#     tag_stage = "customer"
#     project = var.project

#     # instance variables

#     instance_type = "t3.medium"
#     tag_name = "Verify-${var.project}-prod-a-Ubuntu-22"
#     key_name = "new-servers"
#     subnet_id = module.vpc_main.application_subnet_a_id
#     target_group_name = ""
#     vpc-id = module.vpc_main.vpc_id
#     instance_profile = "BeaconDockerBuilder"
#     security_group = module.vpc_main.security_group_docker_builder
#     user_data = file("../../modules/ec2/user-data/sb-userdata.sh")
#     public_ip = false
# }

module "verify-sb" {
    source = "../../modules/ec2"
    environment = "sb"
    tag_stage = "skip"
    project = var.project

    # instance variables
    #aws_ami = "ami-053b0d53c279acc90"
    instance_type = "t3.medium"
    tag_name = "Verify-${var.project}-sb-Ubuntu-22"
    key_name = "integration"
    subnet_id = module.vpc_main.application_subnet_a_id
    target_group_name = ""
    vpc-id = module.vpc_main.vpc_id
    instance_profile = "BeaconDockerBuilder"
    security_group = module.vpc_main.security_group_application
    public_ip = false
}