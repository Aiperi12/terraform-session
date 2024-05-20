resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "terraform-vpc"
  }
}

     /// subnets ///
resource "aws_subnet" "public_subnets" {
  count = 4 
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element ( var.public_cidr_blocks, count.index)
  availability_zone = element (var.public_availability_zones, count.index)
  
  tags = {
    Name = element (var.names_of_public_subnets, count.index)
  }
}

resource "aws_subnet" "private_subnets" {
  count = 4 
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element ( var.private_cidr_blocks, count.index)
  availability_zone = element (var.private_availability_zones, count.index)
  
  tags = {
    Name = element (var.names_of_private_subnets, count.index)
  }
}

     /// route table   ///
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "public-route-table"
  }
}     
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "private-route-table"
  }
}    


    /// route table associations ///

resource "aws_route_table_association" "public_subnets_associations" {
    count = 4
    subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
    route_table_id = aws_route_table.public_rt.id
  
}

resource "aws_route_table_association" "private_subnets_associations" {
    count = 4
    subnet_id = element(aws_subnet.private_subnets[*].id, count.index)
    route_table_id = aws_route_table.private_rt.id
  
}

   // internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet-gw"
  }
}
   // nat gateway
resource "aws_eip" "ngw" {
  
}
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.ngw.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = "nat-gw"
  }

  depends_on = [aws_internet_gateway.igw]
}


    // gateways route

resource "aws_route" "igw_route" {
  route_table_id = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  
}

resource "aws_route" "ngw_route" {
  route_table_id = aws_route_table.private_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.ngw.id
  
}
 