resource "aws_security_group" "private" {
  name        = "private"
  description = "Security Group for private"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "ssh_jump_private"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_public" {

  security_group_id = aws_security_group.private.id
  cidr_ipv4         = "${aws_instance.public.private_ip}/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "Allow SSH connection from public host"
  tags              = var.tags
}


resource "aws_vpc_security_group_egress_rule" "allow_ssh_public" {
  security_group_id = aws_security_group.private.id

  cidr_ipv4   = "${aws_instance.public.private_ip}/32"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

