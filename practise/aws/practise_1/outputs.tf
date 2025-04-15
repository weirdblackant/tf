output "vpc1_id" {
  value = aws_vpc.vpc1.id
}

output "instance_ids" {
  value = [for instance in aws_instance.ec2_1: instance.id]
}
