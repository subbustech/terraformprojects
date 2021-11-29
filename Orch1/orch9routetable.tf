# Route Table for Public Subnets
resource "aws_route_table" "publicrt" {
  vpc_id = aws_vpc.OrchVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.orch-igw.id
  }

  tags = {
    Name = "publicrt"
  }
}

# Route Table for Private Subnet 1
resource "aws_route_table" "privatert1" {
  vpc_id = aws_vpc.OrchVPC.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATGW1.id
  }

  tags = {
    Name = "privatert1"
  }
}

# Route Table for Private Subnet 2
resource "aws_route_table" "privatert2" {
  vpc_id = aws_vpc.OrchVPC.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATGW2.id
  }

  tags = {
    Name = "privatert2"
  }
}
