
// Create a VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

// Create a Subnet 1
resource "aws_subnet" "terraform_public_subnet1" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"
  tags = {
    Name = var.subnet_name1
  }
}

// Create a Subnet 2
resource "aws_subnet" "terraform_public_subnet2" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone       = "${var.region}a"
  tags = {
    Name = var.subnet_name2
  }
}

// Creating an Internet Gateway
resource "aws_internet_gateway" "terraform_igw" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = var.igw_name
  }
}

// Create a route table
resource "aws_route_table" "terraform_public_rt" {
  vpc_id = aws_vpc.terraform_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform_igw.id
  }
  tags = {
    Name = var.rt_name
  }
}

// Associate subnet with route table
resource "aws_route_table_association" "terraform_rt_public_subnet" {
  subnet_id        = aws_subnet.terraform_public_subnet.id
  route_table_id   = aws_route_table.terraform_public_rt.id
}

// Create a security group
resource "aws_security_group" "terraform_sg" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

// Create EC2 Instance
resource "aws_instance" "terraform_server" {
  ami                    = var.ami_id
  key_name               = var.key_name
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.terraform_public_subnet.id
  vpc_security_group_ids = [aws_security_group.terraform_sg.id]
  tags = {
    Name = var.instance_name
  }
}
