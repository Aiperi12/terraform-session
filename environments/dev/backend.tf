terraform {
  backend "s3" {
    bucket = "terraform-session-bucket"
    key    = "_env_/terraform.tfstate" // Path to your remote backend file (terrafoem.tfstate)
    region = "us-west-2"
  }
}
