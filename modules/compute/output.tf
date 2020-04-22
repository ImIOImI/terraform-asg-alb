output "web-url" {
  value = module.web-url.url
}

output "asg-id" {
  value = module.compute.this_autoscaling_group_id
}