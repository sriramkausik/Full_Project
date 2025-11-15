variable "accesskey" {
  #description = "AKIAZJZGHHCC7YZEJB7L"
  #type        = string
  default     =  "AKIAZJZGHHCC7YZEJB7L"
  }

variable "secretkey" {
  #description = "qBmGwCSHqXrU8w1Xn7tiwwrgJgYJJj27rJ3rmvwF"
  #type        = string
  default = "qBmGwCSHqXrU8w1Xn7tiwwrgJgYJJj27rJ3rmvwF"
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