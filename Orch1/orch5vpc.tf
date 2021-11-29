# Resource: VPC
resource "aws_vpc" "OrchVPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "OrchVPC"
  }
}

# Public Subnet1
resource "aws_subnet" "PublicSubnet1" {
  vpc_id            = aws_vpc.OrchVPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.availzone1
  tags = {
    Name = "PublicSubnet1"
  }
}

# Public Subnet2
resource "aws_subnet" "PublicSubnet2" {
  vpc_id            = aws_vpc.OrchVPC.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.availzone2
  tags = {
    Name = "PublicSubnet2"
  }
}

# Private Subnet1
resource "aws_subnet" "PrivateSubnet1" {
  vpc_id            = aws_vpc.OrchVPC.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = var.availzone1
  tags = {
    Name = "PrivateSubnet1"
  }
}

# Private Subnet2
resource "aws_subnet" "PrivateSubnet2" {
  vpc_id            = aws_vpc.OrchVPC.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = var.availzone2
  tags = {
    Name = "PrivateSubnet2"
  }
}
