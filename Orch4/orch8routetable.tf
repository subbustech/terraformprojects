# Route Table for Public Subnets
resource "aws_route_table" "publicrt1" {
  vpc_id = aws_vpc.OrchVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.orch-igw.id
  }

  tags = {
    Name = "publicrt1"
  }
}

resource "aws_route_table" "publicrt2" {
  vpc_id = aws_vpc.OrchVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.orch-igw.id
  }

  tags = {
    Name = "publicrt2"
  }
}
