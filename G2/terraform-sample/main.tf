terraform {
  required_version = ">= 0.15"
}

provider "aws" {
  version = "3.27.0"
  region = "us-east-1"
}

// VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "your-vpc"
  }
}

// Subnet
resource "aws_subnet" "your-sub-pub1" {
  vpc_id = aws_vpc.main.id

  availability_zone = "us-east-1a"

  cidr_block = "10.0.10.0/24"

  tags = {
    Name = "your-sub-pub1"
  }
}

resource "aws_subnet" "your-sub-pub2" {
  vpc_id = aws_vpc.main.id

  availability_zone = "us-east-1b"

  cidr_block = "10.0.20.0/24"

  tags = {
    Name = "your-sub-pub2"
  }
}

resource "aws_subnet" "your-sub-pri1" {
  vpc_id = aws_vpc.main.id

  availability_zone = "us-east-1a"

  cidr_block = "10.0.15.0/24"

  tags = {
    Name = "your-sub-pri1"
  }
}

resource "aws_subnet" "your-sub-pri2" {
  vpc_id = aws_vpc.main.id

  availability_zone = "us-east-1b"

  cidr_block = "10.0.21.0/24"

  tags = {
    Name = "your-sub-pri2"
  }
}

// Internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "your-sub-gw"
  }
}

// Route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "your-sub-public"
  }
}

resource "aws_route" "public" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.public.id
  gateway_id = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "your-sub-pub1" {
  subnet_id = aws_subnet.your-sub-pub1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "your-sub-pub2" {
  subnet_id = aws_subnet.your-sub-pub2.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "your-sub-private"
  }
}

resource "aws_route" "private" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.private.id
  gateway_id = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "your-sub-pri1" {
  subnet_id = aws_subnet.your-sub-pri1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "your-sub-pri2" {
  subnet_id = aws_subnet.your-sub-pri2.id
  route_table_id = aws_route_table.private.id
}

// Security Group
resource "aws_security_group" "bastion" {
  name = "bastion"
  description = "for work server"
  vpc_id = aws_vpc.main.id

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "bastion" {
  security_group_id = aws_security_group.bastion.id

  type = "ingress"

  from_port = 22
  to_port = 22
  protocol = "tcp"

  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_instance" "bastion" {
  ami = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  key_name = "your-key-pair"
  subnet_id =  aws_subnet.your-sub-pub1.id
  associate_public_ip_address = "true"
  vpc_security_group_ids = [
    aws_security_group.bastion.id
  ]
  tags = {
    Name = "bastion"
  }
}