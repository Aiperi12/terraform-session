terraform {
  required_version = "1.8.3"  //Terraform version
  required_providers {   // Provider version
    aws = {
        source = "hashicorp/aws"
        version = "5.49.0"
    }
  }
}

// 1.8.3 = Symentic Versioning
// 1 = Major (Upgrade) = Main changes
// 8 = Minor (Update) = Features/ Enhancements
// 3 = Patch (Patching) = Fix Vulnerabilities



# 1.8.0 --> 1.8.x = (>= 1.8.0, < 1.9.0), (~> 1.8.0)
# 5.49.0 --> 5.49.x = (>= 5.49.0, < 5.50.0), (~> 5.49.0)

# Lazy Constraint: ~>