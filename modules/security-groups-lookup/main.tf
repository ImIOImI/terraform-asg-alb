
data aws_security_groups "compute" {
  filter {
    name = "tag:${var.compute-tag}"
    values = ["true"]
  }
}
output "compute-ids" {
  value = data.aws_security_groups.compute.ids
}

variable "compute-tag" {}