output "url" {
  value = aws_route53_record.record.name
}

output "dns-target" {
  value = aws_route53_record.record
}

output "zone-id" {
  value = module.zone.zone-id
}