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
    Component = "web"
  }
}
variable zone_name {
    default = "bhargavdevops.online"
}