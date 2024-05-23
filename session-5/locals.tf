// Naming Convention: Naming Standard (for the resources)

// 1. Provider name: as, azure, google
// 2. Region: use1, usw1, usw2
// 3. Environment: dev, qa, stage, prod
// 4. Project Name: batman, tom, jerry
// 5. Resource Type: ec2, s3, alb, asg, sg, rds
// 6. Application Tier: frontend, backend, db

# RDS Instance:
# aws-usw2-dev-tom-db-rds

# S3 bucket:
# aws-usw2-dev-tom-backend-s3

# EC2:
# aws-usw2-dev-tom-frontend-ec2

// Tagging Standard: Common Tags

// 1. Environment: dev, qa, stage, prod
// 2. Project Name: batman, tom, jerry
// 3. Application Tier: frontend, backend, db
// 4. Team: cloud, devops, development
// 5. Owner: Kris
// 6. Managed_By: cloudformation,terraform, python, manual
// 7. Lead: Guliza


locals {
  name = "aws-${var.region}-${var.env}-${var.project}-${var.tier}-sqs"

  common_tags = {
    Environment = var.env
    Project     = var.project
    Tier        = var.tier
    Team        = var.team
    Owner       = var.owner
    Managed_By  = var.managed_by
  }
}
