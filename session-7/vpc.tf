resource "aws_default_vpc""main" {                   //// managing default vpc ///////////

    tags = merge (
       { Name = replace(local.name, "rtype", "default-vpc")} ,
        local.common_tags
    )
}
  
resource "aws_default_subnet" "public_subnet_1" {
  availability_zone = "us-west-2a"
  tags = merge (
    { Name = replace(local.name, "rtype", "public_subnet_1")} ,
    local.common_tags
)
}

resource "aws_default_subnet" "public_subnet_2" {
  availability_zone = "us-west-2b"
  tags = merge (
    { Name = replace(local.name, "rtype", "public_subnet_2")} ,
    local.common_tags
)
}

resource "aws_default_subnet" "public_subnet_3" {
  availability_zone = "us-west-2c"
  tags = merge (
    { Name = replace(local.name, "rtype", "public_subnet_3")} ,
    local.common_tags
)
}

# How to run multiple maps into a single map?
# Merge function: merges multiple tags into a single map