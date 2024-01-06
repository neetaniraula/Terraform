#Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#Configure aws provider
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

#Resource Block
resource "aws_instance" "app_server" {
  ami           = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  tags = {
    Name = "AppServer"
  }
}

resource "aws_s3_bucket" "test" {
  bucket = "neeta-aws-bucket"
  tags = {
    Name = "My public bucket"
    Env = "Developers"
  }
  
}
