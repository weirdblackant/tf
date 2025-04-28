locals {
  keypairs = toset(var.key_pairs)
}

resource "aws_key_pair" "ex1" {
  for_each   = local.keypairs
  key_name   = each.value
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMhfLiKHpj4R7rnRhT4UwESXHB22LE2ABjfU5N9mS9vs ubuntu@ip-172-31-88-161"
}
