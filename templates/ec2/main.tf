terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    } 
  }
}

provider "aws" {
    region = "us-east-1"
    access_key = var.accesskey
    secret_key = var.secretkey
}


resource "aws_instance" "app1_instance" {
  ami           = var.ami_id  # Example AMI ID for Amazon Linux 2 in us-east-1
  instance_type = var.instance_type

  tags = {
    Name = var.tags
  }
}

