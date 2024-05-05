variable "sg_id" {
description = "SG ID for application load balancer"  
type = string
}

variable "subnets" {
    description = "subnets"
    type = list(string)
  
}

variable "vpc_id" {
    description = "VPC ID for all"
type = string  
}

variable "instances" {
  type = list(string)
}