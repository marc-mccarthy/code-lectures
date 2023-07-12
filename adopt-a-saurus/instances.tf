#################################
# INSTANCES                     #
#################################

resource "aws_instance" "dino-littlefoot-website" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)  # Grabs the latest AMI from the data source.
  instance_type          = var.instance_type                               # Size of instance. Smallest for testing.
  subnet_id              = aws_subnet.subnet1.id                           # Specifies the ID of the subnet where the instance will be launched.
  vpc_security_group_ids = [aws_security_group.dino-sg.id]                 # Sets the security group IDs for the instance.

  # Provides the user data script that will be executed.
  # Installs the "dino-littlefoot-website" package. 
  # Starts the Nginx service.
  # Removes the default Nginx index.html file. 
  # Creates a new index.html file with custom content.
  user_data = <<EOF
    #! /bin/bash
    sudo amazon-linux-extras install -y nginx1
    sudo service nginx start
    sudo rm /usr/share/nginx/html/index.html
    echo '<html><head><title>Adopt-a-Saurus: Dino #1</title></head><body style=\"background-color:#FFFF00\"><p style=\"text-align: center;\"><span style=\"color:#0022FF;\"><span style=\"font-size:120px;\">You did it... Here is a Apatosaurus we found named Littlefoot!</span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
  EOF

  tags = local.common_tags  # Attribute applies the common tags defined in the locals block.                                             
}

resource "aws_instance" "dino-petrie-website" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)  # Grabs the latest AMI from the data source.
  instance_type          = var.instance_type                               # Size of instance. Smallest for testing.
  subnet_id              = aws_subnet.subnet2.id                           # Specifies the ID of the subnet where the instance will be launched.
  vpc_security_group_ids = [aws_security_group.dino-sg.id]                 # Sets the security group IDs for the instance.

  # Provides the user data script that will be executed.
  # Installs the "dino-littlefoot-website" package. 
  # Starts the Nginx service.
  # Removes the default Nginx index.html file. 
  # Creates a new index.html file with custom content.
  user_data = <<EOF
    #! /bin/bash
    sudo amazon-linux-extras install -y nginx1
    sudo service nginx start
    sudo rm /usr/share/nginx/html/index.html
    echo '<html><head><title>Adopt-a-Saurus: Dino #2</title></head><body style=\"background-color:#FFFF00\"><p style=\"text-align: center;\"><span style=\"color:#0022FF;\"><span style=\"font-size:120px;\">You did it... Here is a Pteranodon we found named Petrie!</span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
  EOF

  tags = local.common_tags  # Attribute applies the common tags defined in the locals block.
}

resource "aws_instance" "dino-ducky-website" {
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)  # Grabs the latest AMI from the data source.
  instance_type          = var.instance_type                               # Size of instance. Smallest for testing.
  subnet_id              = aws_subnet.subnet3.id                           # Specifies the ID of the subnet where the instance will be launched.
  vpc_security_group_ids = [aws_security_group.dino-sg.id]                 # Sets the security group IDs for the instance.
  
  # Provides the user data script that will be executed.
  # Installs the "dino-littlefoot-website" package. 
  # Starts the Nginx service.
  # Removes the default Nginx index.html file. 
  # Creates a new index.html file with custom content.
  user_data = <<EOF
    #! /bin/bash
    sudo amazon-linux-extras install -y nginx1
    sudo service nginx start
    sudo rm /usr/share/nginx/html/index.html
    echo '<html><head><title>Adopt-a-Saurus: Dino #3</title></head><body style=\"background-color:#FFFF00\"><p style=\"text-align: center;\"><span style=\"color:#0022FF;\"><span style=\"font-size:120px;\">You did it... Here is a Saurolophus we found named Ducky!</span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
  EOF

  tags = local.common_tags  # Attribute applies the common tags defined in the locals block.
}

#################################
# DATA                          #
#################################

# Gets the latest Amazon Linuz AMI.
data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
