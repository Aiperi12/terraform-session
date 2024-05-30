terraform {
  backend "s3" {
    bucket = "terraform-session-bucket"
    key    = "terraform-session/terraform.tfstate" // Path to your remote backend file (terrafoem.tfstate)
    region = "us-west-2"
  }
}
