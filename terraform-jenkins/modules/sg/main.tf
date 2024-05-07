resource "aws_security_group" "sg" {
  name        = "addy"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = [80, 443, 22, 8080]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "addy-security"
  }
}