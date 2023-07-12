#################################
# LOAD BALANCER                 #
#################################

# Creates an AWS Application Load Balancer (ALB) that distributes incoming traffic across the registered targets.
resource "aws_lb" "dino-aws-lb" {
  name               = "dino-aws-lb"                                                          # Specifies the name of the ALB.
  internal           = false                                                                  # Indicates whether the ALB is internal or externally accessible.
  load_balancer_type = "application"                                                          # Specifies the type of the ALB.
  security_groups    = [aws_security_group.alb_sg.id]                                         # Specifies the security group(s) associated with the ALB.
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]  # Specifies the subnets in which the ALB should be deployed.
  enable_deletion_protection = false                                                          # Specifies whether deletion protection is enabled for the ALB.
  tags = local.common_tags                                                                    # Attribute applies the common tags defined in the locals block.
}

# Defines an AWS target group, which is used by the ALB to route traffic to registered targets.
resource "aws_lb_target_group" "dino-aws-lb-target-group" {
  name     = "dino-aws-lb-tg"  # Specifies the name of the target group. 
  port     = 80                # Specifies the port number on which the target group receives traffic.
  protocol = "HTTP"            # Protocol used by the target group. In this case.
  vpc_id   = aws_vpc.vpc.id    # Specifies the ID of the Virtual Private Cloud (VPC).
  tags = local.common_tags     # Attribute applies the common tags defined in the locals block.
}

# Creates a listener for the ALB. It listens on port 80 and forwards incoming traffic to the target group.
resource "aws_lb_listener" "dino-aws-lb-listener" {
  load_balancer_arn = aws_lb.dino-aws-lb.arn                             # WHich Load Balancer to listen for?
  port              = "80"                                               # Specifies the port number on which the ALB listener listens for incoming traffic.
  protocol          = "HTTP"                                             # Specifies the protocol used by the listener.
  # Defines the action to be taken for requests that match the listener's rules. 
  default_action {
    type             = "forward"                                         # Should be forwarded to the target group
    target_group_arn = aws_lb_target_group.dino-aws-lb-target-group.arn  # Specifies the port number on which the ALB listener listens for incoming traffic.
  }
  tags = local.common_tags                                               # Attribute applies the common tags defined in the locals block.
}

# Attach the Littlefoot instance to the appropriate target group.
resource "aws_lb_target_group_attachment" "dino-littlefoot-aws-lb-tga" {
  target_id        = aws_instance.dino-littlefoot-website.id           # The instance to attach.
  target_group_arn = aws_lb_target_group.dino-aws-lb-target-group.arn  # The target group to attach.
  port             = 80                                                # Port to attach on.
}

# Attach the Petrie instance to the appropriate target group.
resource "aws_lb_target_group_attachment" "dino-petrie-aws-lb-tga" {
  target_id        = aws_instance.dino-petrie-website.id               # The instance to attach.
  target_group_arn = aws_lb_target_group.dino-aws-lb-target-group.arn  # The target group to attach.
  port             = 80                                                # Port to attach on.
}

# Attach the Ducky instance to the appropriate target group.
resource "aws_lb_target_group_attachment" "dino-ducky-aws-lb-tga" {
  target_id        = aws_instance.dino-ducky-website.id                # The instance to attach.
  target_group_arn = aws_lb_target_group.dino-aws-lb-target-group.arn  # The target group to attach.
  port             = 80                                                # Port to attach on.
}
