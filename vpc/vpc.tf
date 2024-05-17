resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "terraform-vpc"
  }
}
       // subnets

resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "public-subnet-1"
  }
}
resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "public-subnet-2"
  }
}
resource "aws_subnet" "public-subnet-3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-west-2c"

  tags = {
    Name = "public-subnet-3"
  }
}
resource "aws_subnet" "public-subnet-4" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-west-2d"

  tags = {
    Name = "public-subnet-4"
  }
}
resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "private-subnet-1"
  }
}
resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.12.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "private-subnet-2"
  }
}
resource "aws_subnet" "private-subnet-3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.13.0/24"
  availability_zone = "us-west-2c"

  tags = {
    Name = "private-subnet-3"
  }
}
resource "aws_subnet" "private-subnet-4" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.14.0/24"
  availability_zone = "us-west-2d"

  tags = {
    Name = "private-subnet-4"
  }
}

     //route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "public-route-table"
  }
}     
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "private-route-table"
  }
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
  subnet_id     = aws_subnet.public-subnet-1.id

  tags = {
    Name = "NAT-gw"
  }

  depends_on = [aws_internet_gateway.igw]
}

   // subnets route table associations

resource "aws_route_table_association" "public-subnet1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-rt.id

}
resource "aws_route_table_association" "public-subnet2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-rt.id

}
resource "aws_route_table_association" "public-subnet3" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.public-rt.id

}
resource "aws_route_table_association" "public-subnet4" {
  subnet_id      = aws_subnet.public-subnet-4.id
  route_table_id = aws_route_table.public-rt.id

}
resource "aws_route_table_association" "private-subnet1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-rt.id

}
resource "aws_route_table_association" "private-subnet2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-rt.id

}
resource "aws_route_table_association" "private-subnet3" {
  subnet_id      = aws_subnet.private-subnet-3.id
  route_table_id = aws_route_table.private-rt.id

}
resource "aws_route_table_association" "private-subnet4" {
  subnet_id      = aws_subnet.private-subnet-4.id
  route_table_id = aws_route_table.private-rt.id

}

    // gateways route

resource "aws_route" "r" {
  route_table_id = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
  
}

resource "aws_route" "ngw-rt" {
  route_table_id = aws_route_table.private-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.ngw.id
  
}
 