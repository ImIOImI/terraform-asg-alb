variable "environment" {
  type = string
}

variable "dns-name" {
  type = string
}

variable "alias-name" {
  type = string
  description = "name of alias like (ex: aws_elb.main.dns_name)"
}

variable "evaluate-health" {
  type = bool
  default = false
}

variable "zone-id" {
  type = string
  description = "zone-id"
}

variable "domain" {}