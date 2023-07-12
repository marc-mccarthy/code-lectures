#################################
# OUTPUTS                       #
#################################
# The outputs.tf file defines the output values that are displayed after Terraform applies the configuration.
# These outputs are useful for retrieving information about the deployed infrastructure.

# The bucket_name output displays the name of the S3 bucket created.
output "bucket_name" {
  value = aws_s3_bucket.website-bucket.bucket
}

# The bucket_url output provides the URL endpoint for accessing the website hosted on the S3 bucket.
output "bucket_url" {
  value = "http://${aws_s3_bucket.website-bucket.website_endpoint}"
}
