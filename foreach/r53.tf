resource "aws_route53_record" "expense" {
   for_each = aws_instance.expense #each.key: (db,backend,frontend),each.item:
   
 

  zone_id = "Z07723142N736V4HE6Z3C"
  #name    = var.instance_names[count.index]=="frontend"? var.domain_name: "${var.instance_names[count.index]}.${var.domain_name}"
  name=    each.key=="frontend" ? var.domain_name:"${each.key}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  #records = var.instance_names[count.index]=="frontend" ? [aws_instance.expense[count.index].public_ip]:[aws_instance.expense[count.index].private_ip]
  records = each.key=="frontend"? [each.value.public_ip]:[each.value.private_ip]
  allow_overwrite = true
}