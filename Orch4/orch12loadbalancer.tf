# Target group for application load balancer
resource "aws_lb_target_group" "targetgroup" {
  health_check {
    interval            = 5
    path                = "/"
    protocol            = "HTTP"
    timeout             = 2
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  stickiness {
    type    = "lb_cookie"
    enabled = true
  }
  name        = "targetgroup"
  port        = 8080
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.OrchVPC.id
}

# Applicaiton Load Balancer
resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-security-group.id]
  subnets            = [aws_subnet.PublicSubnet1.id, aws_subnet.PublicSubnet2.id]

  tags = {
    Name = "alb"
  }

  timeouts {
    create = "30m"
    delete = "30m"
  }
}

# Load Balancer Listener
resource "aws_lb_listener" "alblistener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetgroup.arn
  }
}

# Load Balancer Target Group attachment for first instance
resource "aws_lb_target_group_attachment" "myec2vm1tg1" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = aws_instance.myec2vm1.id
  port             = 8080
}

resource "aws_lb_target_group_attachment" "myec2vm2tg1" {
  target_group_arn = aws_lb_target_group.targetgroup.arn
  target_id        = aws_instance.myec2vm2.id
  port             = 8080
}
