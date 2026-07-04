# vodaservice/terraform/main.tf

resource "aws_s3_bucket" "b" {
  bucket = "mon-bucket-prive-5g"
}

# CORRECTION : Blocage de tout accès public au bucket
resource "aws_s3_bucket_public_access_block" "b_access_block" {
  bucket = aws_s3_bucket.b.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Suppression de la ressource aws_s3_bucket_acl qui créait la faille
