variable "vpc_cidr" {
    description = "giving the cidr range of the vpc"
    type = string

  
}

variable "subnet_cidr" {
    description = "giving the cidr range of the subnet"
    type = list(string)
    
  
}

variable "subnet_names" {
    description = "giving the names of the subnet"
    type = list(string)
    default = [ "publicsubnet1" , "publicsubnet2" ]
    
  
}