# 1. Création d'une clé KMS pour le chiffrement
resource "aws_kms_key" "s3_key" {
  description             = "Clé pour le chiffrement du bucket S3"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

# 2. Association au bucket S3
resource "aws_s3_bucket_server_side_encryption_configuration" "b_encryption" {
  bucket = aws_s3_bucket.b.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.s3_key.arn
    }
  }
}
