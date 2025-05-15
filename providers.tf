provider "aws" {
    region = var.region
/*    assume_role {
      role_arn = "arn:aws:iam::926508937180:role/test_demo"
    }
*/    
  }

terraform {
  backend "s3" {
    region = "us-east-1"
    key = "test/test.tfstate"
    bucket = "rajeshterraformtest"
/*    dynamodb_table = "value"
    encrypt = true
*/    
  }
}