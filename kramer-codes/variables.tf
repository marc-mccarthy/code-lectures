#################################
# VARIABLES                     #
#################################
# The variables.tf file defines the input variables used in the Terraform configuration.

variable "aws_access_key" {
  type = string
  description = "Local access key generated from AWS"
}

variable "aws_secret_key" {
  type = string
  description = "Local secret key generated from AWS"
}

variable "aws_region" {
  type = string
  description = "Deployed AWS region for default services"
}

variable "aws_bucket_name" {
  type = string
  description = "S3 Bucket name"
}
