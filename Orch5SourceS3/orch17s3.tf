resource "aws_s3_bucket" "cicd_bucket" {
  bucket = var.artifacts_bucket_name
  acl    = "private"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "folder1" {
  bucket = aws_s3_bucket.cicd_bucket.id
  acl    = "private"
  key    = "myapplication"
}
