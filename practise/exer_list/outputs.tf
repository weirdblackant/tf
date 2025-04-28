output "keys" {
  value = [for key in aws_key_pair.ex1: key.id]
}
