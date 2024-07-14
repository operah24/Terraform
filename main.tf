terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-north-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0249211c9916306f8"
  instance_type = "t3.micro"
  key_name      = "terraform"

  tags = {
    Name = "Terraform-session-one"
  }
}

resource "aws_ecr_repository" "terraform" {
  name                 = "terraform-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}