resource "aws_route53_record" "expense" {
   count=length(var.instance_names) # 3
 

  zone_id = "Z07723142N736V4HE6Z3C"
  name    = var.instance_names[count.index]=="frontend"? var.domain_name: "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = var.instance_names[count.index]=="frontend" ? [aws_instance.expense[count.index].public_ip]:[aws_instance.expense[count.index].private_ip]
}