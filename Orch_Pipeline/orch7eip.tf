# Elastic Ip 1
resource "aws_eip" "eip1" {
  depends_on = [aws_internet_gateway.orch-igw]
  instance   = aws_instance.myec2vm1.id
  vpc        = true
  tags = {
    "Name" = "EIP1"
  }
}

# Elastic Ip 2
resource "aws_eip" "eip2" {
  depends_on = [aws_internet_gateway.orch-igw]
  instance   = aws_instance.myec2vm2.id
  vpc        = true
  tags = {
    "Name" = "EIP2"
  }
}
