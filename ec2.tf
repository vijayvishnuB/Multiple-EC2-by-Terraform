# VPC,name, CIDR and Tags
resource "aws_vpc" "myvpc" {
  cidr_block           = "172.31.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "myvpc"
  }
}

# Public Subnets in VPC
resource "aws_subnet" "new1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "172.31.32.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "tag1"
  }
}

resource "aws_subnet" "new2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-1b"

  tags = {
    Name = "tag2"
  }
}

# Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "myvpc-gw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "myvpc"
  }
}

# Route Tables for Internet gateway
resource "aws_route_table" "myvpc-public" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myvpc-gw.id
  }

  tags = {
    Name = "tag1"
  }
}

# Route Associations public subnets
resource "aws_route_table_association" "new1-a" {
  subnet_id      = aws_subnet.new1.id
  route_table_id = aws_route_table.myvpc-public.id
}

resource "aws_route_table_association" "new2-a" {
  subnet_id      = aws_subnet.new2.id
  route_table_id = aws_route_table.myvpc-public.id
}


# EC2 instances in public subnets
resource "aws_instance" "server1" {
  ami           = "ami-093613b5938a7e47c"
  instance_type = "t2.micro"
  subnet_id = "subnet-0dfb79ea1bd8ccd72"
  tags = {
    Name = "server1"
  }
}

resource "aws_instance" "server2" {
  ami           = "ami-093613b5938a7e47c"
  instance_type = "t2.micro"
  subnet_id = "subnet-060ee5c75a1b4a2cd"
  tags = {
    Name = "server2"
  }
}
