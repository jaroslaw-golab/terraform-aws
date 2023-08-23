data "aws_caller_identity" "owner" {
  
}
data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "template_file" "user_data" {
  template = file("../../modules/ec2/user-data/cloud-init.yml")
}

resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  iam_instance_profile = var.instance_profile
  subnet_id = var.subnet_id
  associate_public_ip_address = var.public_ip
  user_data = data.template_file.user_data.rendered
  vpc_security_group_ids = [
    var.security_group
  ]
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    tags                  = {}
    volume_size           = 8
    volume_type           = "gp3"
  }
  tags = {
    "Name"  = var.tag_name,
    "Stage" = var.tag_stage
  }
  
}
