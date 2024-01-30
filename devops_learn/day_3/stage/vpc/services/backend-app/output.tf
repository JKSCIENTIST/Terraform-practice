output "bucket_arn" {
    value = aws_s3_bucket.racist.arn
    description = "ARN of S3 Bucket:"
  
}

output "aws_dynamodb_table" {
  value = aws_dynamodb_table.lock.name
  description = "Table_name:"
}
