variable "instance_type" {
  default = "t3.micro"
}

variable "instance_names" {
    type = list 
    default = ["db","backend","frontend"]
  
}

variable "common_tags" {
    type=map 

    default = {
      Project="expense"
      Environment="dev"
      terraform=true
    } 
  
}

variable "domain_name" {
  default = "daws78s-nnr.online"
}