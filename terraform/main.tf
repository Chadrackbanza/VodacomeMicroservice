# vodaservice/terraform/main.tf

resource "aws_s3_bucket" "b" {
  bucket = "mon-bucket-prive-5g"
}

# 1. Blocage de tout accès public (Déjà présent)
resource "aws_s3_bucket_public_access_block" "b_access_block" {
  bucket = aws_s3_bucket.b.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 2. Ajout du chiffrement côté serveur (Correction AWS-0132)
resource "aws_s3_bucket_server_side_encryption_configuration" "b_encryption" {
  bucket = aws_s3_bucket.b.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
