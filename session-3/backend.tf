terraform {
  backend "s3" {
    bucket = "terraform-session-bucket"
    key = "session-3/terraform.tfstate"   // Path to your remote backend file (terrafoem.tfstate)
    region = "us-west-2"
     }
}