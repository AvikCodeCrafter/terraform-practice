data "aws_key_pair" "key_pair" {
  key_name           = "mykey"
  include_public_key = true
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = "${var.env}-instance"
  ami = var.ec2_ami_id
  instance_type = "${var.instance_type}"
  key_name      = data.aws_key_pair.key_pair.key_name
  monitoring    = true
  create_eip =    true
  create_security_group = false
  count = var.instance_count
  depends_on = [ aws_default_vpc.default_vpc,aws_security_group.security-group,data.aws_key_pair.key_pair ]
  vpc_security_group_ids = [aws_security_group.security-group.id]
  tags = {
    Terraform   = "true"
    Environment = "${var.env}-server"
  }
}

resource "aws_default_vpc" "default_vpc" {
  
}

resource "aws_security_group" "security-group" {
  name   = "${var.env}-infra-app-sg"
  vpc_id = aws_default_vpc.default_vpc.id
  ingress {
    description = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    description = "All Access Open Outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.env}-Public-ssh-access"
  }
}

