# Internet Gateway
resource "aws_internet_gateway" "orch-igw" {
  vpc_id = aws_vpc.OrchVPC.id

  tags = {
    Name = "orch-igw"
  }
}
