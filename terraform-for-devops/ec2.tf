# ssh key to login to EC2

resource "aws_key_pair" "iac-key" {
    key_name = "terra-key"
    public_key = file("terra-key.pub")
}

# Default VPC and Security Group

resource "aws_default_vpc" "vpc_default" {
}

resource "aws_security_group" "sg_ec2_ssh" {
    name = "allow-ssh"
    description = "this will add ssh port clearence"
    vpc_id = aws_default_vpc.vpc_default.id # Interpolation
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

# Ec2 Instnce 

resource "aws_instance" "my_instance" {
    ami = var.ec2_ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.iac-key.key_name
    vpc_security_group_ids = [aws_security_group.sg_ec2_ssh.id]
    user_data = file("install-nginx.sh")
    depends_on = [ aws_security_group.sg_ec2_ssh, aws_default_vpc.vpc_default, aws_key_pair.iac-key]
    root_block_device {
      volume_size = var.root_storage_size
      volume_type = "gp3"  
    }
    tags = {
      Name = "Avik-Terraform-Server"
    } 
}
# Eip Attaching 

resource "aws_eip" "my_instance_eip" {
    instance = aws_instance.my_instance.id
}

# Import Ec2 Server

resource "aws_instance" "import_terra_entry_server" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t3.medium"
  tags = {
    Name = "iac-entry"
  }
}

# Import Key-pair

resource "aws_key_pair" "import_key" {
  key_name = "mykey"
  public_key = "placeholder"
  lifecycle {
    ignore_changes = [ public_key ]
  }
}