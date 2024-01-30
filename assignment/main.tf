provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "Terra-bucket"{

  bucket = var.bucket_name
  tags = {Name = var.bucket_tag }

}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.Terra-bucket.id
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_acl" "name" {
  bucket = aws_s3_bucket.Terra-bucket.id
  depends_on = [ aws_s3_bucket_ownership_controls.ownership , aws_s3_bucket_public_access_block.access ]
  acl = "public-read"
}

resource "aws_s3_bucket_public_access_block" "access" {
  bucket = aws_s3_bucket.Terra-bucket.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.Terra-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}