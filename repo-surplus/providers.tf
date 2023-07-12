#################################
# PROVIDERS                     #
#################################
# The providers.tf file specifies the required provider and configures the GitHub provider.

terraform {
  required_providers {
    # The terraform block sets the required provider version.
    # https://registry.terraform.io/providers/integrations/github/latest/docs
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# The provider block configures the GitHub provider with the specified token and owner.
provider "github" {
  # These credentials are used to authenticate and interact with GitHub.
  token = var.github_token
  owner = var.github_owner
}
