output "bucket_name" {
  description = "S3 bucket name for our static website."
  value = module.terrahouse_aws.bucket_name
}