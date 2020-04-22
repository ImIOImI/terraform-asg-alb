variable "environment" {
  type = string
  description = "AWS Environment"
  default = "dev"
}

variable "domain" {
  type = string
  description = "This is a domain that you have control over in Route53"
  default = "dev.example.com"
}

variable "key-name"{
  type = string
  description = "SSH key for the compute instance"
  default = "AWS-DEV-WEB-PEM"
}

variable "s3-log-bucket"{
  type = string
  description = "this is a bucket that hold all the logs for the ALB"
  default = "dev-example-logs"
}

variable "compute-sg-tag" {
  type = string
  description = "Put this tag on all security groups that a compute instance should have"
  default = "Compute"
}

variable "public-subnet-tag" {
  type = string
  description = "Put this tag on any subnets that the alb should have access to"
  default = "Public"
}

variable "default-vpc-tag" {
  type = string
  description = "Put this tag on a single VPC that you want to deploy to"
  default = "Default"
}

variable "health-check-type" {
  type = string
  description = "Determines if the auto scaling group uses an EC2 health check or an ELB health check"
  default = "EC2"
}