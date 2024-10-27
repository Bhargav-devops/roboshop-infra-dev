#!/bin/bash
component=$1
environment=$2 #dont use env here, it is reserved in 

#yum install python3.11-devel python3.11-pip -y
#pip3.11 install ansible --upgrade
#pip3.11 install botocore boto3  --upgrade
# yum install -y python3-devel python3-pip
# pip3 install ansible botocore boto3

yum install python3.12-devel python3.12-pip -y
pip3.12 install botocore boto3
yum install ansible -y

ansible-pull -U https://github.com/Bhargav-devops/roroboshop-ansible-roles-tf.git -e component=$component -e env=$environment main-tf.yaml

# ansible-pull -U https://github.com/daws-76s/roboshop-ansible-roles-tf.git \
#   -e component=$component \
#   -e env=$environment \
#   -e ansible_python_interpreter=/usr/bin/python3.11 \
#   main-tf.yaml
