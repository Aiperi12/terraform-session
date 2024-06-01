////////////////////// METADATA /////////////
variable "env" {
    type = string
    description = "Environment"
    default = "dev"
  
}
variable "team" {
    type = string
    description = "Team"
    default = "devops"
  
}
variable "project" {
    type = string
    description = "Project"
    default = "nemo"
  
}
variable "app" {
    type = string
    description = "Application"
    default = "dori"
  
}

/////////////// SECURITY GROUP ////////////////

variable "ec2_ports" {
    type = list (object({
        port = number
        protocol = string
    }
    ))
    default = [
    {
        port = 80
        protocol = "tcp"
    },
    {
        port = 22
        protocol = "tcp"

    }
    ]
 }
 variable "alb_ports" {
    type = list (object({
        port = number
        protocol = string
    }
    ))
    default = [
    {
        port = 80
        protocol = "tcp"
    },
    {
        port = 443
        protocol = "tcp"

    }
    ]
 }


 //////////////// Launch template ///////////
 variable "instance_type" {
    type = string
    description = "instance type"
    default = "t2.micro"
  
}

variable "zone_id" {
    type = string
    description = "zone id for route53"
    default = "Z04418872A28VBEVGJHDE"
  
}

