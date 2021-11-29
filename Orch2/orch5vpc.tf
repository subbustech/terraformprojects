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
  availability_zone = "us-east-1a"
  tags = {
    Name = "PublicSubnet1"
  }
}
