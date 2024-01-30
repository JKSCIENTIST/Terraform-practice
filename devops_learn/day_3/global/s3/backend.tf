resource "aws_s3_bucket" "racist" {
  bucket = "terra-racist-backend"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "on" {
    bucket = aws_s3_bucket.racist.id

    versioning_configuration {
      status = "Enabled"
    }
  
}

resource "aws_s3_bucket_server_side_encryption_configuration""SHA"{
  bucket = aws_s3_bucket.racist.id
  rule {
    apply_server_side_encryption_by_default{
        sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public-access" {
  bucket = aws_s3_bucket.racist.arn
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  
}

resource "aws_dynamodb_table" "lock" {
  name = "dynamo420"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

