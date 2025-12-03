output "bucket_id" {
  description = "The ID of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.arn
}

output "bucket_domain_name" {
  description = "The domain name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket"
  value       = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}

output "bucket_region" {
  description = "The AWS region where the bucket is located"
  value       = aws_s3_bucket.s3_bucket.region
}
