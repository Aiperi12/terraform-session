terraform {
  backend "s3" {
    bucket = "terraform-session-bucket"
    key = "extras/terraform.tfstate"   
    region = "us-west-2"
     }
}