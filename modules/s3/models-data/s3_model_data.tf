resource "aws_s3_bucket" "s3ModelDataBucket" {
  bucket = "${var.account_id}-model-data"


  tags = {
    "Name" = "${var.account_id}-model-data"
  }

}

resource "aws_s3_bucket_ownership_controls" "s3ModelDataBucket" {
  bucket = aws_s3_bucket.s3ModelDataBucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3ModelDataBucket" {
  depends_on = [aws_s3_bucket_ownership_controls.s3ModelDataBucket]

  bucket = aws_s3_bucket.s3ModelDataBucket.id
  acl    = "private"
}
