resource "aws_instance" "expense" {
    for_each = var.instance_names # each.key (db,backend,frontend), each.value (t3.small,t3.micro,t3.micro)
     #count.index - 0,1,2 
  #ami           = "ami-090252cbe067a9e58"
  ami=  data.aws_ami.ami_info.id

  #instance_type = "t3.micro"
  #instance_type = var.instance_type
  #db : t3.small ,front_end: t3.micro backend: t3.micro 
  #instance_type = var.instance_names[count.index]=="db"? "t3.small":"t3.micro" 
  instance_type = each.value
  #vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  vpc_security_group_ids = ["sg-0f0ac6832cd4edcc7"]

  tags = merge(var.common_tags,{
    Name = each.key
    Module = each.key
    
    
  }
  )
}

#resource resource_type    resource_name

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_ssh"
    CreatedBy="NNR"
  }

   #inbound rules
    ingress {
    from_port        = 22 #for SSH port 
    to_port          = 22
    protocol         = "tcp" #for all protocols
    cidr_blocks      = ["0.0.0.0/0"] #all traffic

  }

   #outbound rules
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }


}