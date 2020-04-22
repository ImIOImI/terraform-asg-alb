module "network-lookup" {
  source = "../../network-lookup"
  public-subnet-tag = var.public-subnet-tag
  vpc-tag = var.default-vpc-tag
}

module "cert" {
  source = "../cert"
  domain = var.domain
}