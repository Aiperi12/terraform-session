locals {
  name = "aws-${var.team}-${var.project}-${var.app}-rtype-${var.env}"
  common_tags = {
    Environment = var.env
    Team = var.team
    Application = var.app
    Project = var.project
    Owner = "Aiperi"
    Managed_By = "Terraform"

  }

  asg_tags = merge (
    {Name = replace(local.name, "rtype", "asg")},
    local.common_tags
  )
  }


// name: aws-team-project-app-env
// tags: enviroment, team, application, project, owner, managed by
