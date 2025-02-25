terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.69.0"
    }
  }

  backend "s3" {
    bucket = "bhargav-bucket-dev"
    key    = "payment"
    region = "us-east-1"
    dynamodb_table = "bhargav-locking-dev"
  }

}

provider "aws" {
    region = "us-east-1"
}