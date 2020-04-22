data "aws_route53_zone" "zone" {
  name = var.domain
}

variable "domain" {}

output "zone-id" {
  value = data.aws_route53_zone.zone.id
}