
variable "region" {
    default = "us-east-1"
}
variable "project" {}
variable "environment" {}
variable "key_name" {}
variable "instance_type" {}
#variable "aws_ami" {}
variable "tag_stage" {}
variable "subnet_id" {}
variable "security_group" {}
variable "instance_profile" {}
variable "target_type" {
    default = "instance"
}
variable "target_group_name" {}
variable "tag_name" {}
variable "vpc-id" {}
variable "public_ip" {}
