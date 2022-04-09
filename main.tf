terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = "eu-west-3"
}

# Create a VPC
resource "aws_vpc" "jenya" {
  cidr_block = "193.154.6.0/24"
  tags = {
    Name = "jenya-vpc"
  }
}

###### subnet_web #####
resource "aws_subnet" "web" {
  vpc_id     = aws_vpc.jenya.id
  cidr_block = "193.154.6.0/27"

  tags = {
    Name = "jenya-subnet_web"
  }
}

###### subnet_app #####
resource "aws_subnet" "app" {
  vpc_id     = aws_vpc.jenya.id
  cidr_block = "193.154.6.32/27"

  tags = {
    Name = "jenya-subnet_app"
  }
}

###### subnet_db #####
resource "aws_subnet" "db" {
  vpc_id     = aws_vpc.jenya.id
  cidr_block = "193.154.6.64/28"

  tags = {
    Name = "jenya-subnet_db"
  }
}