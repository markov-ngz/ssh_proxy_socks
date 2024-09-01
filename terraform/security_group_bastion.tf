resource "aws_security_group" "public" {
  name        = "public"
  description = "Security Group for public"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "ssh_jump_public"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_dev" {

  security_group_id = aws_security_group.public.id
  cidr_ipv4         = var.public_ip
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "Allow everyone to  establish an SSH connection"
  tags              = var.tags
}


resource "aws_vpc_security_group_egress_rule" "allow_ssh_dev" {
  security_group_id = aws_security_group.public.id

  cidr_ipv4   = var.public_ip
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}


resource "aws_vpc_security_group_ingress_rule" "allow_ssh_private" {

  security_group_id = aws_security_group.public.id
  cidr_ipv4         = "10.0.2.0/24"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "Allow everyone to  establish an SSH connection"
  tags              = var.tags
}


resource "aws_vpc_security_group_egress_rule" "allow_ssh_private" {
  security_group_id = aws_security_group.public.id
  cidr_ipv4         = "10.0.2.0/24"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {

  security_group_id = aws_security_group.public.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "Allow everyone to  establish an SSH connection"
  tags              = var.tags
}


resource "aws_vpc_security_group_egress_rule" "allow_http" {
  security_group_id = aws_security_group.public.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  description       = "Allow everyone to  establish an SSH connection"
  tags              = var.tags
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {

  security_group_id = aws_security_group.public.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  description       = "Allow everyone to  establish an SSH connection"
  tags              = var.tags
}


resource "aws_vpc_security_group_egress_rule" "allow_https" {
  security_group_id = aws_security_group.public.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  description       = "Allow everyone to  establish an SSH connection"
  tags              = var.tags
}

