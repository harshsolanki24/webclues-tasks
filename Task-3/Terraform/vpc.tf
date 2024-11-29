resource "aws_security_group" "ec2-sg" {
  name = "${var.ec2_sg_name}"

  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "${var.ec2_sg_name}"
  }
}

resource "aws_eip" "ec2_eip" {
    domain = "vpc"
    tags = {
      "Name" = "${var.ec2_eip_name}"
    }
}



resource "aws_instance" "ec2" {
    ami = "ami-024c319d5d14b463e"
    instance_type = "t3.micro"
    key_name = "cric-auction"
    security_groups = ["${aws_security_group.ec2-sg.id}"]
    # associate_public_ip_address = true
 #   subnet_id = "${aws_subnet.public_subnet_cidrs[0].id}"
    subnet_id = "${aws_subnet.public[0].id}"
    root_block_device {
      volume_type = "gp2"
      volume_size = "27"
    }

    tags = {
      "Name" = "terraform-ec2"
    }
}

resource "aws_eip_association" "ec2_eip-associate" {
  instance_id = aws_instance.ec2.id
  allocation_id = aws_eip.ec2_eip.id
}