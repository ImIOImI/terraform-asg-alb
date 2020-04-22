module "zone" {
  source = "../zone"
}

resource "aws_route53_record" "record" {
  zone_id = module.zone.zone-id
  name    = var.dns-name
  type    = "A"
  alias {
    evaluate_target_health = var.evaluate-health
    name = var.alias-name
    zone_id = var.zone-id
  }
}