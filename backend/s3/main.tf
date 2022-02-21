resource "aws_s3_bucket" "s3_backend" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = true
  }

  tags = local.tags
}

resource "aws_s3_bucket_versioning" "s3_backend" {
  bucket = var.bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "s3_backend" {
  bucket = var.bucket_name
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_backend" {
  bucket = var.bucket_name

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }

}

resource "aws_dynamodb_table" "db_backend" {
  name         = var.dynamodb_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = local.tags
}
