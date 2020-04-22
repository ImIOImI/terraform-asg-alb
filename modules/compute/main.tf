locals {
  tags = {
    Name = var.name
    Terraform = true
    AMI = var.ami
  }
  
  url = lower("${var.name}.${module.global.domain}")
}

data "aws_lb" "selected" {
  name = var.alb-name
  depends_on = [var.asg_depends_on]
}

data "aws_lb_listener" "https" {
  load_balancer_arn = data.aws_lb.selected.arn
  port              = 443
}

data "aws_lb_listener" "http" {
  load_balancer_arn = data.aws_lb.selected.arn
  port              = 80
}

module "compute" {
  source = "github.com/terraform-aws-modules/terraform-aws-autoscaling"

  image_id = var.ami
  security_groups             = module.sg.compute-ids
  instance_type               = var.instance
  key_name                    = module.global.key-name
  associate_public_ip_address = true

  desired_capacity = var.desired-capacity
  health_check_type = module.global.health-check-type
  max_size = var.max-capacity
  min_size = var.min-capacity
  name = var.name
  vpc_zone_identifier = module.network.public-subnet-ids
  tags_as_map = local.tags
}

module "web-url" {
  source = "../route53/alias"
  dns-name = lower(var.name)
  environment = module.global.environment
  alias-name = data.aws_lb.selected.dns_name
  zone-id = data.aws_lb.selected.zone_id
}

module "group" {
  source = "../lb/group"
  alb-name = var.alb-name
  tags = local.tags
  web-arn = data.aws_lb.selected.arn
  name = var.name
  asg-id = module.compute.this_autoscaling_group_id
}

resource "aws_lb_listener_rule" "https" {
  listener_arn = data.aws_lb_listener.https.arn
  priority     = var.priority

  action {
    type             = "forward"
    target_group_arn = module.group.http-arn
  }

  condition {
    host_header {
      values = [local.url]
    }
  }
}

resource "aws_lb_listener_rule" "http" {
  listener_arn = data.aws_lb_listener.http.arn
  priority     = var.priority

  action {
    type             = "forward"
    target_group_arn = module.group.http-arn
  }

  condition {
    host_header {
      values = [local.url]
    }
  }
}