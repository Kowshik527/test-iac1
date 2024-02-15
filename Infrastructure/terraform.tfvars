region = "${region}" #need

#VPC
vpc_name       = "${vpc_name}" #need
vpc_cidr_block = "${vpc_cidr_block}" #need

#Private Subnet
private_subnet_name       = "${private_subnet_name}" #need
private_subnet_cidr_block = "${private_subnet_cidr_block}" #need
availability_zone_2       = "${availability_zone_2}" #need

#Public subnet
public_subnet_name  = "${public_subnet_name}" #need
subnet_cidr_block   = "${subnet_cidr_block}" #need
availability_zone_1 = "${availability_zone_1}" #need

igw_name           = "${igw_name}" #need
gateway_route_cidr = "0.0.0.0/0"

nat_name              = "${nat_name}" #need 
nat_connectivity_type = "public"
eip_domain            = "vpc"
eip_name              = "IAC-EIP"

public_route_name  = "IAC-Public-Route"
private_route_name = "IAC-Private-Route"

sg_name = "IAC-SG" #ned
#common
# root_password = "${root_password}" #need
key_name = "windows_sap_application"
# Private_ami   = "ami-0e85d8711447c8e98"

#Jump EC2 - WIN
Jump_ami_Win           = "ami-094aa6728b151e05a"
Jump_instance_type_Win = "t2.micro" #need
Jump_instance_name_Win = "IAC-Jump-WIN-EC2" #need
ebs_v_size_win         = "30" #need 
ebs_v_type_win         = "gp2" #need

#Jump EC2 - Ubuntu
Jump_ami_Ubuntu           = "ami-05fb0b8c1424f266b"
Jump_instance_type_Ubuntu = "t2.micro" #need
Jump_instance_name_Ubuntu = "IAC-Jump-Ubuntu-EC2" #need
ebs_v_size_ubuntu         = "8" #need 
ebs_v_type_ubuntu         = "gp3" #need

