terraform {    // configuration block
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.1.0"
    }
  }
}
variable "devops-region" {
     default ="us-west-2"
}

provider "aws" { //provider block
  # Configuration options
  region  = var.devops-region
  //credentials to connect aws
}

resource "aws_vpc" "devops-vpc" {
  cidr_block = "10.0.0.0/27"
  instance_tenancy = "default"

  tags = {
    Name = "devops-vpc-tf"
  }
}
resource "aws_internet_gateway" "devops-igw" {
  vpc_id = aws_vpc.devops-vpc.id

  tags = {
    Name = "devops-tf-igw"
  }
}

