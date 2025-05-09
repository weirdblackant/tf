resource "aws_s3_bucket" "s3-1" {
bucket = "jenkins-pool"

tags = {
  Name = "Jenkins-storage" 
}
}
