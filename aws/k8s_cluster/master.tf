resource "vpc" "vpc1" {
cidr_block = var.vpc_cidr_block  
}

resource "subnet" "sub1" {
vpc_id = vpc.vpc1.id
for_each = toset(var.subnet_cidr)
cidr_block = each.key
}
