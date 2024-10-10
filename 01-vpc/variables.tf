variable "project_name" {
    default = "roboshop"
}

variable "cidr_block" {
    default = "10.0.0.0/16"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Project = "roboshop"
        Environment = "dev"
        Terraform = true
    }
}
variable "vpc_tags" {
    default = {}
}
variable "public_subnet_cidr"{
    default = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "public_subnet_tags"{
    default = {}
}

variable "private_subnet_cidr"{
    default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "private_subnet_tags"{
    default = {}
}
variable "database_subnet_cidr"{
    default = ["10.0.21.0/24","10.0.22.0/24"]
}

variable "database_subnet_tags"{
    default = {}
}

variable "is_perring_required"{
    default = true
}