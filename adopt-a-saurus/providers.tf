#################################
# PROVIDERS                     #
#################################
# The providers.tf file specifies the required provider and configures the AWS provider.

terraform {
  required_providers {
    # The terraform block sets the required provider version.
    # https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

# The provider block configures the AWS provider with the specified region, access key, and secret key.
provider "aws" {
  # These credentials are used to authenticate and interact with AWS services.
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
}
