output "vpc1_id" {
  value = aws_vpc.vpc1.id
}

output "sg_id" {
  value = aws_security_group.sg1.id
}
output "instance_ids" {
  value = [for instance in aws_instance.ec2_1 : instance.id]
}
