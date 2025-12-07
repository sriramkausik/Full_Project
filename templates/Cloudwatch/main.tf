terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    } 
  }
}

provider "aws" {
    region = "us-east-1"
    access_key = "AKIA3FBYBGDYS7BZVU74"
    secret_key = "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"
}



module "ec2_instance" {
  source = "git::https://github.com/sriramkausik/Terraform_Module.git//ec2"

  instances = var.instances
}


