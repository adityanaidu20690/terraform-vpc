variable "sg_id" {
    description = "sg id for ec2 instance"
    type = string
  
}

variable "subnets" {
description = "name of the subnet"
type = list(string)
}

variable "ec2_names" {
  description = "ec2 names"
  type = list(string)
  default = [ "webserver1" , "webserver2"]
}