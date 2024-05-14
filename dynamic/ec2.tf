resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_ssh"
    CreatedBy="NNR"
  }

#    #inbound rules
#     ingress {
#     from_port        = 22 #for SSH port 
#     to_port          = 22
#     protocol         = "tcp" #for all protocols
#     cidr_blocks      = ["0.0.0.0/0"] #all traffic

#   }
dynamic "ingress" {
    for_each = var.inbound_rules
    content {
      from_port = ingress.value["port"]
      to_port = ingress.value["port"]
      protocol=ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_allow"]
    }
  
}

   #outbound rules
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }


}