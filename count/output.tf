output "ami_id" {
  value = data.aws_ami.ami_info.id
}

# output "aws_info" {
#   value = aws_instance.expense
# }

# output "public_ip_frontend" {
#     value = aws_instance.expense[2].public_ip
  
# }

# output "private_ip_db" {
#     value = aws_instance.expense[0].private_ip
  
# }

# output "private_ip_backend" {
#     value = aws_instance.expense[1].private_ip
  
# }

# output "var_names" {
#   value = var.instance_names
# }

output "aws_instances" {
    value = aws_instance.expense
  
}

