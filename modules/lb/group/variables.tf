variable "name" {
  type = string
  description = "Name of the application the group is for"
}

variable "alb-name" {
  type = string
  description = "Name of the alb for compute"
}

variable "tags" {
  description = "List of tags for alb groups and listeners"
}

variable "asg-id" {
  description = "Instance of the compute server to loadbalance"
}

variable "web-arn" {
  type = string  
  description = "arn of the alb to attach all the groups and listeners to"
}