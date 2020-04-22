data "aws_route53_zone" "zone" {
  name = module.global.domain
}

output "zone-id" {
  value = data.aws_route53_zone.zone.id
}

module "global" {
  source = "./../../.global"
}