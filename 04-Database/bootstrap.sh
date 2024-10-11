#!/bin/bash
component = $1
environment = $2
yum install python3.11-devel python3.11-pip -y
pip3.11 install ansible boto boto3

ansible-pull -u https://github.com/Bhargav-devops/roroboshop-ansible-roles-tf.git -e component=$component -e env=$environment main-tf.yaml