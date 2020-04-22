data "aws_subnet_ids" "public" {
  filter {
    name = "tag:${var.public-subnet-tag}"
    values = [true]
  }
  vpc_id = data.aws_vpc.vpc.id
}

variable "public-subnet-tag" {}