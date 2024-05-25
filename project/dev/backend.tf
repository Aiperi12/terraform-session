terraform {
  backend "s3" {
    bucket = "terraform-session-bucket"
    key = "project/dev/terraform.tfstate"   // Path to your remote backend file (terrafoem.tfstate)
    region = "us-west-2"
     }
}