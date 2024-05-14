resource "aws_instance" "expense" {

  ami=  "ami-090252cbe067a9e58"

  instance_type = "t3.micro"

  vpc_security_group_ids = ["sg-035bd444d13fbad2f"]

   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
  }

}