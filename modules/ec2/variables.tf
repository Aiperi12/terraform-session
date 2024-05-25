variable "env" {
  type = string    // data type
  description = "this variable is for environment" // description
  default = "dev"    // default value

}
variable "ami" {
  type = string    // data type
  description = "AMI" // description
  default = "ami-01cd4de4363ab6ee8"     // default value

}
variable "instance_type" {
  type = string    // data type
  description = "instance size" // description
  default = "t2.micro"     // default value

}
variable "sg" {
    type = list(string)
    description = "security group id"
    default = [ "" ]
  
}