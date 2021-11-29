# NAT Gateway 1
resource "aws_nat_gateway" "NATGW1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.PublicSubnet1.id

  tags = {
    Name = "NATGW1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.orch-igw]
}

# NAT Gateway 2
resource "aws_nat_gateway" "NATGW2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.PublicSubnet2.id

  tags = {
    Name = "NATGW2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.orch-igw]
}
