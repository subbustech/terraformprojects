# Elastic Ip 1
resource "aws_eip" "eip1" {
  instance = aws_instance.myec2vm1.id
  vpc      = true
}
