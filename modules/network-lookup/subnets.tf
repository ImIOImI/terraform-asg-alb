data "aws_subnet_ids" "public" {
  filter {
    name = "tag:${module.global.public-subnet-tag}"
    values = [true]
  }
  vpc_id = data.aws_vpc.vpc.id
}

module "global" {
  source = "../.global"
}