#################################
# VARIABLES                     #
#################################
# The variables.tf file defines the input variables used in the Terraform configuration.

variable "github_token" {
 type = string
}

variable "github_owner" {
 type = string
}

variable "author" {
  type = string
  default = "the collector dude"
}

variable "iteration" {
  type = list
  default = ["Zero", "1st", "2nd", "3rd", "4th", "5th"]  
}
