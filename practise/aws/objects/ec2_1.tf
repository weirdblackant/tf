resource "aws_instance" "ec2-1" {
  ami    = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  key_name = "key1"
}
