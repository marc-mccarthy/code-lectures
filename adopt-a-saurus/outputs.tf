#################################
# OUTPUTS                       #
#################################
# The outputs.tf file defines the output values that are displayed after Terraform applies the configuration.
# These outputs are useful for retrieving information about the deployed infrastructure.

# The load_balance_url output provides the URL endpoint for accessing the load balancer.
output "load_balance_url" {
  value = "http://${aws_lb.dino-aws-lb.dns_name}"
}
