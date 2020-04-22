data "aws_acm_certificate" "cert" {
  domain   = module.global.domain
  statuses = ["ISSUED"]
}

module "global" {
  source = "../../.global"
}

output "arn" {
  value = data.aws_acm_certificate.cert.arn
}

output "id" {
  value = data.aws_acm_certificate.cert.id
}