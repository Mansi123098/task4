terraform {
  backend "s3" {
    bucket = "mansitask123456"
    
    key   = "global/state/terraform.tfstate" 
    region = "ap-northeast-1"
    dynamodb_table = "terraform-locks"
    
  }
}

