instances = [

  {
    name          = "web-2"
    ami           = "ami-0fa3fe0fa7920f68e"
    instance_type = "t3.small"
    subnet_id     = "subnet-0a93c65a68e9f1f6c"
    tags = {
      Environment = "dev"
      Owner       = "shriram"
    }
  },

    {
    name          = "web-3"
    ami           = "ami-0fa3fe0fa7920f68e"
    instance_type = "t3.small"
    subnet_id     = "subnet-0a93c65a68e9f1f6c"
    tags = {
      Environment = "dev"
      Owner       = "shriram"
    }
  }
]



