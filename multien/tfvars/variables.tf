variable "instance_type" {
  default = "t3.micro"
}

#count based
# variable "instance_names" {
#     type = list 
#     default = ["db","backend","frontend"]
  
# }

variable "instance_names" {
    type = map 
    default = {
        # db="t3.small"
        # backend="t3.micro"
        # frontend="t3.micro"
    }
  
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