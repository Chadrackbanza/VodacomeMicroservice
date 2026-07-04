# vodaservice/terraform/main.tf
resource "aws_s3_bucket" "b" {
  bucket = "mon-bucket-prive-5g"
}

# FAILLE : Ce bucket est ouvert à tout le monde
resource "aws_s3_bucket_acl" "b_acl" {
  bucket = aws_s3_bucket.b.id
  acl    = "public-read-write" 
}
