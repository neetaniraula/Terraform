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

#Resource Block ec2
resource "aws_instance" "app_server" {
  count = 2
  ami           = "ami-079db87dc4c10ac91"
  instance_type = "t2.micro"
  subnet_id = "subnet-001c9c1e02b114936"
  security_groups = ["sg-08cc89d4360ec9dc2"]
  key_name = "neeta-dashboard"
  tags = {
    Name = "AppServer"
  }
}

#Resource Block s3 bucket
resource "aws_s3_bucket" "example" {
  bucket = "cloud-aws-bucket1"
  tags = {
    Name = "My bucket"
    Env = "Developers"
  }
  
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}
