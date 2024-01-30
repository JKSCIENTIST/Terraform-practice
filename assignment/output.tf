output "bucket_name" {
  value = aws_s3_bucket.Terra-bucket.bucket
  description = "Bucket Name"
}

output "bucket_arn" {
    value = aws_s3_bucket.Terra-bucket.arn
    description = "Bucket ARN"
}