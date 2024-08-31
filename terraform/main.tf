terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
    local = {
      source = "hashicorp/local"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-3"
}


resource "aws_key_pair" "main" {
  key_name   = var.key_name
  public_key = file("${var.key_path}")
  tags = {
    Name = var.key_name
  }
}