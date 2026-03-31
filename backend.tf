terraform {
  backend "s3" {
    bucket  = "demo-abhishekbk-terraform-state"
    key     = "snowflake-capstone/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}