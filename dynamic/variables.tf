variable "inbound_rules" {
    type = list 
    default = [
        {
           port=22
           protocol="tcp"
           cidr_allow=["0.0.0.0/0"]

        },
        {
           port=80
           protocol="tcp"
           cidr_allow=["0.0.0.0/0"]
        },
        {
           port=8080
           protocol="tcp"
           cidr_allow=["0.0.0.0/0"]
        },
        {
           port=3306
           protocol="tcp"
           cidr_allow=["0.0.0.0/0"]            
        }
    ]
  
}