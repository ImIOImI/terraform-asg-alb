module "sg" {
  source = "../security-groups-lookup"
  compute-tag = var.compute-tag
}

module "network" {
  source = "../network-lookup"
  public-subnet-tag = var.public-subnet-tag
  vpc-tag = var.default-vpc-tag
}

module "zones" {
  source = "../route53/zone"
  domain = var.domain
}