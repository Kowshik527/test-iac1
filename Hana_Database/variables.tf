#Region
variable "region" {
  type    = string
<<<<<<< HEAD
  default = "${region}"
=======
  default = "us-east-8"
>>>>>>> 970268a25131f7a24df05e366041755e7fe75f1e
}

#EC2 - HDB
variable "Private_ami" {
  type    = string
  default = "ami-0e85d8711447c8e98"
}
variable "Private_instance_type_HDB" {
  type    = string
<<<<<<< HEAD
  default = "${Private_instance_type_HDB}"
=======
  default = "r4.3333"
>>>>>>> 970268a25131f7a24df05e366041755e7fe75f1e
}
variable "Private_instance_name_HDB" {
  type    = string
  default = "${Private_instance_name_HDB}"
}
variable "key_name" {
  type    = string
  default = "windows_sap_application"
}
variable "iam-role-ec2" {
  type    = string
<<<<<<< HEAD
  default = "${iam_role_ec2}"
=======
  default = "iam.kow"
>>>>>>> 970268a25131f7a24df05e366041755e7fe75f1e
}

#RBS Volumes
variable "rbs_v_size" {
  type    = string
  default = "${rbs_v_size}"
}
variable "rbs_v_type" {
  type    = string
  default = "${rbs_v_type}"
}

#EBS Volumes
variable "ebs_v_size" {
  type    = string
  default = "${ebs_v_size}"
}
variable "ebs_v_type" {
  type    = string
  default = "${ebs_v_type}"
}

#Bastion user
variable "bastion_username" {
  type    = string
  default = "${bastion_username}"
}

#Root 
variable "root_username" {
  type    = string
  default = "${root_username}"
}
variable "root_password" {
  type    = string
  default = "${root_password}"
}

