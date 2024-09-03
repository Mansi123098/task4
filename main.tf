provider "aws" {
  region = "ap-northeast-1"  
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "mansitask123456"  
  

  tags = {
    Name = "MyExampleBucket"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-locks"
  billing_mode    = "PAY_PER_REQUEST" 
  hash_key        = "LockID"

  attribute {
    name = "LockID"
    type = "S"  
  }

  tags = {
    Name        = "Terraform Lock Table"
  }
}



resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-1a" 
  tags = {
    Name = "private-subnet"
  }
}

/*resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-1a" 
  
  tags = {
    Name = "public-subnet"
  }
}*/
