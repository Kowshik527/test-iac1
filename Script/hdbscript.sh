#!/bin/bash

echo "Mounting Disk"
sudo mkfs -t ext4 /dev/xvdb 
sudo mkdir /hana
sudo mount /dev/xvdb /hana
UUID=$(sudo blkid /dev/xvdb | awk -F'["]' '{print $2}')
APPEND_VALUE="UUID=$UUID /hana   ext4   defaults,nofail   0   2"
echo $APPEND_VALUE >> /etc/fstab
sudo mount -a
echo "Mounted Disk"

echo "AWS CLI installation"
AWS_ACCESS_KEY="AKIAXUY5AL4XO6NSX56Q"
AWS_SECRET_KEY="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"
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws configure set aws_access_key_id $AWS_ACCESS_KEY
aws configure set aws_secret_access_key $AWS_SECRET_KEY
echo "AWS CLI installation complete"

echo "Registering the RHEL repos"
RH_USERNAME="ssathishkumar@kaartech.com"
RH_PASSWORD="ozygisha@)!*"
subscription-manager register --username $RH_USERNAME --password $RH_PASSWORD --force
subscription-manager attach --auto
subscription-manager repos --enable=rhel-7-server-rpms
subscription-manager repos --enable=rhel-7-server-optional-rpms
subscription-manager repos --enable=rhel-7-server-extras-rpms
subscription-manager repos --enable=rhel-sap-hana-for-rhel-7-server-rpms
echo "RHEL repos registered"

echo "Installing Required Packages ....."
yum update -y
yum install compat-sap-c++-9 -y
yum install compat-sap-c++-9 expect gtk2 krb5-workstation krb5-libs libaio libatomic libibverbs libcanberra-gtk2 libicu libssh2 libtool-ltdl numactl openssl PackageKit-gtk3-module rsyslog sudo xfsprogs xorg-x11-xauth compat-sap-c++-9 tuned-profiles-sap-hana cairo graphviz iptraf-ng lm_sensors net-tools -y
yum install uuidd libnsl tcsh psmisc nfs-utils bind-utils -y
echo "Installed Required Packages ....."

echo "Getting the Hana DB files from S3"
cd ../hana/
mkdir Hana_Database
cd Hana_Database

# Check if the file exists
if [ -e "sap.zip" ]; then
    echo "The file exists in the folder."
else
    echo "The file does not exist in the folder."
    echo "Downloading SAP HANA HDB"
    aws s3 cp s3://awslaunchwizard/SAP\ HANA\ Database\ Software/51056441.ZIP ./sap.zip    
    echo "Downloaded SAPHANA HDB..."

    echo "unzipping SAPHANA HDB..."
    unzip 'sap.zip'
    echo "unzipped SAPHANA HDB..."
fi
echo "Hana Database files and unzipping over"
cd

echo "Installation is started"
cd ../hana/Hana_Database/DATA_UNITS/
cd HDB_SERVER_LINUX_X86_64/
action="1"
components="2"
path=""
ip="$(ip addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')"
add_hosts="n"
sysID="HDB"
instance_number="001"
work_group=""
system_usage="2"
volume_enc=""
data_volumes=""
log_volumes=""
restrict_mem_allocation=""
resource_limit=""
host_pass="Test@123"
confirm_host_pass="Test@123"
admin_pass="Test@123"
confirm_admin_pass="Test@123"
admin_home_dir=""
admin_login_shell=""
admin_user_id=""
user_group=""
db_user_pass="Test@123"
confirm_db_user_pass="Test@123"
reboot="n"
confirm_install="y"

sudo ./hdblcm <<< "$action"$'\n'"$components"$'\n'"$path"$'\n'"$ip"$'\n'"$add_hosts"$'\n'"$sysID"$'\n'"$instance_number"$'\n'"$work_group"$'\n'"$system_usage"$'\n'"$volume_enc"$'\n'"$data_volumes"$'\n'"$log_volumes"$'\n'"$restrict_mem_allocation"$'\n'"$resource_limit"$'\n'"$host_pass"$'\n'"$confirm_host_pass"$'\n'"$admin_pass"$'\n'"$confirm_admin_pass"$'\n'"$admin_home_dir"$'\n'"$admin_login_shell"$'\n'"$admin_user_id"$'\n'"$user_group"$'\n'"$db_user_pass"$'\n'"$confirm_db_user_pass"$'\n'"$reboot"$'\n'"$confirm_install"

echo "HDB Installation successfull"

