#Region
variable "region" {
  type    = string
  default = "${region}"
}

#EC2 - HDB
variable "Private_ami" {
  type    = string
  default = "ami-0e85d8711447c8e98"
}
variable "Private_instance_type_HDB" {
  type    = string
  default = "${Private_instance_type_HDB}"
}
variable "Private_instance_name_HDB" {
  type    = string
  default = "IAC-HDB-EC2"
}
variable "key_name" {
  type    = string
  default = "windows_sap_application"
}
variable "iam-role-ec2" {
  type    = string
  default = "${iam_role_ec2}"
}

#RBS Volumes
variable "rbs_v_size" {
  type    = string
  default = "150"
}
variable "rbs_v_type" {
  type    = string
  default = "gp2"
}

#EBS Volumes
variable "ebs_v_size" {
  type    = string
  default = "300"
}
variable "ebs_v_type" {
  type    = string
  default = "gp3"
}

#Bastion user
variable "bastion_username" {
  type    = string
  default = "ubuntu"
}

#Root 
variable "root_username" {
  type    = string
  default = "root"
}
variable "root_password" {
  type    = string
  default = "GoldenImage@123"
}

