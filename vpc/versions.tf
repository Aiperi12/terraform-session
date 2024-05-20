terraform {
  required_version = "~> 1.8.0"  //Terraform version
  required_providers {   // Provider version
    aws = {
        source = "hashicorp/aws"
        version = "5.49.0"
    }
  }
}
