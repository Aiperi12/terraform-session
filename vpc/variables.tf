     //// PUBLIC SUBNETS

variable "public_cidr_blocks" {
  type = list(string)   // data type
  description = "this variable is for public cidr_blocks" // description
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24" ]    // default value

}

variable "public_availability_zones" {
  type = list(string)   // data type
  description = "this variable is for public AZ-s" // description
  default = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]    // default value

}

variable "names_of_public_subnets" {
  type = list(string)   // data type
  description = "this variable is for names of public subnets" // description
  default = ["public_subnet_1", "public_subnet_2", "public_subnet_3", "public_subnet_4"]
}

     //// PRIVATE SUBNETS

variable "private_cidr_blocks" {
  type = list(string)   // data type
  description = "this variable is for public cidr_blocks" // description
  default = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24", "10.0.14.0/24" ]    // default value

}
variable "private_availability_zones" {
  type = list(string)   // data type
  description = "this variable is for private AZ-s" // description
  default = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]    // default value

}
variable "names_of_private_subnets" {
  type = list(string)   // data type
  description = "this variable is for names of private subnets" // description
  default = ["private_subnet_1", "private_subnet_2", "private_subnet_3", "private_subnet_4"]
}



