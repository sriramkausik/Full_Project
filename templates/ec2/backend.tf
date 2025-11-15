terraform {
  backend "s3" {
    bucket = "terraform-statefile-v1.1"
    key    = "ec2_dev_app1/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    
  }
}
