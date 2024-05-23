resource "aws_sqs_queue" "terraform_queue" {
  name = replace(local.name, "rtype", "sqs")
  tags = local.common_tags
}


// How to reference to Local Value?
// Syntax: local.local_name
// Example: local.name, local.common_tags

// replace ( local.name, "rtype", "sqs" )
// "aws-${var.region}-${var.env}-${var.project}-${var.tier}-sqs"

resource "aws_db_instance" "main" {
  allocated_storage    = 10
  identifier = replace(local.name, "rtype", "rds")
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = random_password.db_password.result
  parameter_group_name = "default.mysql8.0"
  tags = local.common_tags
  skip_final_snapshot  = var.env != "prod" ? true : false
  final_snapshot_identifier = var.env != "prod" ? null : "${var.env}-final-snapshot"
}

// skip_final_snapshot = true (I don't  need snapshot)
// skip_final_snapshot = false (I need snapshot)

//true = dev, qa, stage
// false = prod

resource "random_password" "db_password" {
 length = 16
 special = true
 override_special = "%"
}