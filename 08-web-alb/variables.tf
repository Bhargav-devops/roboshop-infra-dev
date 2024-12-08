variable "project_name" {
    default = "roboshop"
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
variable "tags" {
  default = {
    Component = "web-alb"
  }
}
variable zone_name {
    default = "bhargavdevops.online"
}