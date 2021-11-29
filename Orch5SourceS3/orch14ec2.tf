# Resource: EC2 Instance
resource "aws_instance" "myec2vm1" {
  ami                         = data.aws_ami.amzlinux2.id
  instance_type               = var.instance_type
  user_data                   = file("${path.module}/app-install.sh")
  key_name                    = var.instance_keypair
  vpc_security_group_ids      = [aws_security_group.webserver-security-group.id]
  subnet_id                   = aws_subnet.PublicSubnet1.id
  availability_zone           = var.availzone1
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = "true"
  tags = {
    "Name" = "EC2 Demo1"
  }
}

# Resource: EC2 Instance
resource "aws_instance" "myec2vm2" {
  ami                         = data.aws_ami.amzlinux2.id
  instance_type               = var.instance_type
  user_data                   = file("${path.module}/app-install.sh")
  key_name                    = var.instance_keypair
  vpc_security_group_ids      = [aws_security_group.webserver-security-group.id]
  subnet_id                   = aws_subnet.PublicSubnet2.id
  availability_zone           = var.availzone2
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = "true"
  tags = {
    "Name" = "EC2 Demo2"
  }
}
