resource "aws_vpc" "vpc1" {
  cidr_block = "192.168.0.0/24"
  tags = {
    Name = "vpc1"
  }
}

resource "aws_subnet" "subnet0" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "192.168.0.0/25"
  tags = {
    Name = "subnet0"
  }
}

resource "aws_internet_gateway" "gw1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "gw1"
  }
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.vpc1.id
  route {
    gateway_id = aws_internet_gateway.gw1.id
    cidr_block = "0.0.0.0/0"
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.subnet0.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_security_group" "sg1" {
  name   = "sg1"
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "sg1"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_rule1" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "sg_rule2" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_network_interface" "netin1" {
  subnet_id       = aws_subnet.subnet0.id
  security_groups = [aws_security_group.sg1.id]
  description     = "ENI for instances"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ec2_1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "key1" 
  user_data = filebase64("./user_data_nfs1.sh")
  network_interface {
    device_index          = 0
    subnet_id             = aws_subnet.subnet0.id
    associate_public_ip_address = true
    security_groups       = [aws_security_group.sg1.id]
  }
  tags = {
    type = "terraformed"
    Name = "e1"
  }
}
