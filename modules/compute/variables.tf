variable "ami" {
  type = string
  description = "ami"
}

variable "instance" {
  type = string
  description = "AWS instance type"
  default = "t3.small"
}

variable "name" {
  type = string
  description = "Name for AWS site"
}

variable "alb-name" {
  type = string
  description = "Name of the alb for this compute instance"
}

variable "desired-capacity" {
  default = 1
}

variable "max-capacity" {
  default = 1
}

variable "min-capacity" {
  default = 1
}

variable "priority" {
  type = number
  description = "order in which the lb rules will be evaluated"
}

variable "asg_depends_on" {
  type    = any
  default = null
}

variable "compute-tag" {}
variable "public-subnet-tag" {}
variable "key-name" {}
variable "health-check-type" {}
variable "environment" {}
variable "domain" {}
variable "default-vpc-tag" {}