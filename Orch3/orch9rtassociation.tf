# Public Route Table Association to Public Subnet 1
resource "aws_route_table_association" "publicrtassociation1" {
  subnet_id      = aws_subnet.PublicSubnet1.id
  route_table_id = aws_route_table.publicrt.id
}
