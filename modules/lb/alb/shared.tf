module "network-lookup" {
  source = "../../network-lookup"
}

module "zone" {
  source = "../../route53/zone"
}

module "security-groups-lookup" {
  source = "../../security-groups-lookup"
}

module "cert" {
  source = "../cert"
}

module "global" {
  source = "../../.global"
}