variable "env" {
  type = string    // data type
  description = "this variable is for environment" // description
  default = "dev"    // default value

}

variable "ports" {
  type = list(number)   // data type
  description = "this variable is for ports" // description
  default = [22, 3306, 443, 80 ]    // default value

}