variable "accesskey" {
  #description = ""
  #type        = string
  default     =  ""
  }

variable "secretkey" {
  #description = ""
  #type        = string
  default = ""
}


variable "ami_id" {

  description = "AMI ID for the EC2 instance"
  type        = string
  
}

variable instance_type{
  description = "Type of EC2 instance"
  type        = string
}

variable tags{
  description = "Tags for the EC2 instance"
  type        = string
}