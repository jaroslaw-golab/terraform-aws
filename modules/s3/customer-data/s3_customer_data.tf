resource "aws_s3_bucket" "s3CustomerDataBucket" {
  bucket = "${var.account_id}-customer-submissions-${var.environment}"


  tags = {
    "Name" = "${var.account_id}-customer-submissions-${var.environment}"
  }

}

resource "aws_s3_bucket_ownership_controls" "s3CustomerDataBucket" {
  bucket = aws_s3_bucket.s3CustomerDataBucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3CustomerDataBucket" {
  depends_on = [aws_s3_bucket_ownership_controls.s3CustomerDataBucket]

  bucket = aws_s3_bucket.s3CustomerDataBucket.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "kms" {
  bucket = aws_s3_bucket.s3CustomerDataBucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms
      sse_algorithm     = "aws:kms"
    }
  }

}
