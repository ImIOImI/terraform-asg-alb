module "network-lookup" {
  source = "../../network-lookup"
  public-subnet-tag = var.public-subnet-tag
  vpc-tag = var.default-vpc-tag
}

module "zone" {
  source = "../../route53/zone"
  domain = var.domain
}

module "security-groups-lookup" {
  source = "../../security-groups-lookup"
  compute-tag = var.compute-tag
}

module "cert" {
  source = "../cert"
  domain = var.domain
}