// place where i will all my child module
module "ec2" {
    ////////////// Module argument ///////////////
    source = "../../modules/ec2"    // Required Argument, where you specify the location of child module
    # version = ""   // Required Argument, where you specify the version of your child module

    /////////////// Input variables that are required for the child module /////////////////
    env = "dev"
    ami = "ami-01cd4de4363ab6ee8"
    instance_type = "t2.micro" 
    sg = [module.sg.security_group_id]
}

module "sg" {
    source = "../../modules/sg"
    env = "dev"
    ports = ["22", "80", "443" ] 
  
}



## How to reference to module?
## Syntax: module.module_name.output_value 
  