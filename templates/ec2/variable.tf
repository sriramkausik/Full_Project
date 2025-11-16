variable "accesskey" {
  #description = ""
  #type        = string
  default     =  "AKIA56FCUOYWFA6B27EC"
  }

variable "secretkey" {
  #description = ""
  #type        = string
  default = "oKFkYa0bqofhskl3CULl+V42FyRGR1lYTaX3EjFl"
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