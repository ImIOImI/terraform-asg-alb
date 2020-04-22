variable "alb-name" {
  type = string
  description = "Name of the alb for compute instance"
}

variable "compute-tag" {}
variable "public-subnet-tag" {}
variable "environment" {}
variable "s3-log-bucket" {}
variable "domain" {}
variable "default-vpc-tag" {}