output "bucket_name" {
  description = "S3 bucket name for our static website."
  value = module.terrahouse_aws.bucket_name
}

output "s3_website_endpoint" {
    value = module.terrahouse_aws.website_endpoint
}

output "cdn_domain" {
  value = module.terrahouse_aws.website_domain
}