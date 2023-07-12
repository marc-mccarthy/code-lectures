#################################
# LOCALS                        #
#################################
# Locals are used to store intermediate values or calculations within the configuration.

locals {
  # Creates common_tags to group tags into one local to be used everywhere.
  common_tags = {
    company      = var.company
    project      = "${var.company}-${var.project}"
    billing_code = var.billing_code
  }
}
