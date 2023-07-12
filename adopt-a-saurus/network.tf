#################################
# NETWORK                       #
#################################

# Defines an AWS Virtual Private Cloud (VPC).
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block        # Specifies the IP address range for the VPC.
  enable_dns_hostnames = var.enable_dns_hostnames  # Enables DNS hostnames for instances within the VPC.
  tags = local.common_tags                         # Attribute applies the common tags defined in the locals block.
}

# Creates an AWS Internet Gateway,
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id   # Attribute associates the subnet with the VPC.
  tags = local.common_tags  # Attribute applies the common tags defined in the locals block.
}

# 1st subnet within the VPC.
resource "aws_subnet" "subnet1" {
  cidr_block              = var.vpc_subnets_cidr_blocks[0]                  # Specifies the IP address range for 1st subnet within the VPC.
  vpc_id                  = aws_vpc.vpc.id                                  # Attribute associates the subnet with the VPC.
  map_public_ip_on_launch = var.map_public_ip_on_launch                     # Determines whether instances in the subnet receive a public IP address upon launch.
  availability_zone       = data.aws_availability_zones.available.names[0]  # The 1st Availability Zone.
  tags = local.common_tags                                                  # Attribute applies the common tags defined in the locals block.
}

# 2nd subnet within the VPC.
resource "aws_subnet" "subnet2" {
  cidr_block              = var.vpc_subnets_cidr_blocks[1]                  # Specifies the IP address range for 2nd subnet within the VPC.
  vpc_id                  = aws_vpc.vpc.id                                  # Attribute associates the subnet with the VPC.
  map_public_ip_on_launch = var.map_public_ip_on_launch                     # Determines whether instances in the subnet receive a public IP address upon launch.
  availability_zone       = data.aws_availability_zones.available.names[1]  # The 2nd Availability Zone.
  tags = local.common_tags                                                  # Attribute applies the common tags defined in the locals block.
}

# 3rd subnet within the VPC.
resource "aws_subnet" "subnet3" {
  cidr_block              = var.vpc_subnets_cidr_blocks[2]                  # Specifies the IP address range for 3rd subnet within the VPC.
  vpc_id                  = aws_vpc.vpc.id                                  # Attribute associates the subnet with the VPC.
  map_public_ip_on_launch = var.map_public_ip_on_launch                     # Determines whether instances in the subnet receive a public IP address upon launch.
  availability_zone       = data.aws_availability_zones.available.names[2]  # The 3rd Availability Zone.
  tags = local.common_tags                                                  # Attribute applies the common tags defined in the locals block.
}

#################################
# ROUTING                       #
#################################

# Creates an AWS route table, which controls the traffic between subnets within a VPC.
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id                     # Attribute associates the subnet with the VPC.
  route {
    cidr_block = "0.0.0.0/0"                  # Default route that directs traffic to the internet gateway.
    gateway_id = aws_internet_gateway.igw.id  # Which gatesway does this table refer to?
  }
  tags = local.common_tags                    # Attribute applies the common tags defined in the locals block.
}

# Associate the previously created route table with the corresponding 1st subnet.
resource "aws_route_table_association" "rta-subnet1" {
  route_table_id = aws_route_table.rtb.id  # WHich route table gets this table association?
  subnet_id      = aws_subnet.subnet1.id   # WHich subnet gets this table association?
}

# Associate the previously created route table with the corresponding 2nd subnet.
resource "aws_route_table_association" "rta-subnet2" {
  route_table_id = aws_route_table.rtb.id  # WHich route table gets this table association?
  subnet_id      = aws_subnet.subnet2.id   # WHich subnet gets this table association?
}

# Associate the previously created route table with the corresponding 3rd subnet.
resource "aws_route_table_association" "rta-subnet3" {
  route_table_id = aws_route_table.rtb.id  # WHich route table gets this table association?
  subnet_id      = aws_subnet.subnet3.id   # WHich subnet gets this table association?
}

#################################
# SECURITY GROUPS               #
#################################

# ALB Security Group
resource "aws_security_group" "alb_sg" {
  name   = "elb-sg"        # Name of the security group.
  vpc_id = aws_vpc.vpc.id  # Attribute associates the subnet with the VPC.

  # Allow HTTP traffic from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.common_tags       # Attribute applies the common tags defined in the locals block.
}

# Dino security group
resource "aws_security_group" "dino-sg" {
  name   = "dino_sg"       # Name of the security group.
  vpc_id = aws_vpc.vpc.id  # Attribute associates the subnet with the VPC.

  # HTTP access from VPC
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr_block]
  }

  # Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = local.common_tags       # Attribute applies the common tags defined in the locals block.
}

#################################
# DATA                          #
#################################

data "aws_availability_zones" "available" {}  # Get availability zones from Amazon.
