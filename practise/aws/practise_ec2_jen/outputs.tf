output "vpc_id" {
  value = aws_vpc.vpc1.id
}

output "subnet_id" {
  value = aws_subnet.subnet0.id
}

output "intergwid" {
  value = aws_internet_gateway.gw1.id
}

output "instance_id" {
  value = [for i in aws_instance.ec2_1 : i.id]
}
