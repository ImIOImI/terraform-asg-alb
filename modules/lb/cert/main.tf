data "aws_acm_certificate" "cert" {
  domain   = var.domain
  statuses = ["ISSUED"]
}

variable "domain" {}

output "arn" {
  value = data.aws_acm_certificate.cert.arn
}

output "id" {
  value = data.aws_acm_certificate.cert.id
}