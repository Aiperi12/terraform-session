terraform {
  backend "s3" {
    bucket = "terraform-aws-session-bucket"
    key = "session-3/terraform.tfstate"   // Path to your remote backend file (terrafoem.tfstate)
    region = "us-east-2"
     }
}