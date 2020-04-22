data "aws_vpc" "vpc" {
  filter {
    name = "tag:${var.vpc-tag}"
    values = [true]
  }
}

variable "vpc-tag" {}

