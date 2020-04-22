
data aws_security_groups "compute" {
  filter {
    name = "tag:${module.global.compute-tag}"
    values = ["true"]
  }
}
output "compute-ids" {
  value = data.aws_security_groups.compute.ids
}

module "global" {
  source = "../.global"
}