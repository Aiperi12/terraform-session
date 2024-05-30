module "ec2" {

    source = "github.com/Aiperi12/terraform-session//modules/ec2"   
    ami = "ami-01cd4de4363ab6ee8"
    instance_type = "t2.micro" 
    sg = [module.sg.security_group_id]
}

module "sg" {
    source = "github.com/Aiperi12/terraform-session//modules/sg"
    env = "dev"
    ports = ["22", "80", "443" ] 
  
}

# github.com = Domain Name (SCM)
# /Aiperi12 = github organization
# /terraform-session = repository
# /tree = 
# /main = branch name (default)
# /modules = directory
# /ec2 = subdirectory

