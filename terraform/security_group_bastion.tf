resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "Security Group for bastion"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "ssh_jump_bastion"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_dev" {

  security_group_id = aws_security_group.bastion.id
  cidr_ipv4         = var.public_ip
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "Allow everyone to  establish an SSH connection"
  tags              = var.tags
}


resource "aws_vpc_security_group_egress_rule" "allow_ssh_dev" {
  security_group_id = aws_security_group.bastion.id

  cidr_ipv4   = var.public_ip
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}


resource "aws_vpc_security_group_ingress_rule" "allow_ssh_private" {

  security_group_id = aws_security_group.bastion.id
  cidr_ipv4         = "10.0.2.0/24"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "Allow everyone to  establish an SSH connection"
  tags              = var.tags
}


resource "aws_vpc_security_group_egress_rule" "allow_ssh_private" {
  security_group_id = aws_security_group.bastion.id
  cidr_ipv4   = "10.0.2.0/24"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}



