data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}


data "aws_subnet" "public_subnet" {
    filter {
      name = "tag:Name"
      values = ["Subnet-Public: HMRC-Project-Public Subnet 1"]
    }
    depends_on = [ 
        aws_route_table_association.public_subnet_association
     ] 
}

resource "aws_instance" "hmrc_server" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = "t3.medium"
    tags = {
      Name = "${var.project}-Public-Server"
    }
    key_name = aws_key_pair.hmrc-key.key_name
    subnet_id = data.aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.sg_ec2_ssh.id]
    associate_public_ip_address = true
  
}


resource "aws_security_group" "sg_ec2_ssh" {
    name = "allow-ssh"
    description = "this will add ssh port clearence"
    vpc_id = aws_vpc.vpc-hmrc-us-east-1.id  # Interpolation
    depends_on = [ aws_vpc.vpc-hmrc-us-east-1 ]
    tags = {
        Name = "Public SSH Access"
    }
    ingress {
        description = "Allow SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "All Access Open Outbound"
        from_port = 0
        to_port = 0
        protocol = "-1" # semantically equivalent to all ports 
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_key_pair" "hmrc-key" {
    key_name = "hmrc-key"
    public_key = file("hmrc-key.pub")
  
}

