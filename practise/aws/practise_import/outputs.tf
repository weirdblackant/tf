output "vpc1_id" {
  value = aws_vpc.eks-vpc1.id
}

#output "sg_id" {
#  value = aws_security_group.sg1.id
#}

#output "lt_key_name" {
#  value = aws_launch_template.launch-temp1.key_name
#}

output "aws_subnets" {
  value = [for i in aws_subnet.subnets : i.id]
}

output "rt_id" {
  value = data.aws_route_table.main.id
}
