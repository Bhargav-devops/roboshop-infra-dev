module "roboshop"{
    source = "https://github.com/Bhargav-devops/terraform-aws-vpc"
    #source = "git::https://github.com/Bhargav-devops/terraform-aws-vpc.git"
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    vpc_tags = var.vpc_tags
    
    # public subnet cidr
    public_subnet_cidr = var.public_subnet_cidr

    private_subnet_cidr = var.private_subnet_cidr

    database_subnet_cidr = var.database_subnet_cidr

    is_perring_required = var.is_perring_required
    #check
}