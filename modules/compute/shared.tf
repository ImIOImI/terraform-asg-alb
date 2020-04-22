module "sg" {
  source = "../security-groups-lookup"
}

module "network" {
  source = "../network-lookup"
}

module "zones" {
  source = "../route53/zone"
}

module "global" {
  source = "../.global"
}