data "aws_region" "current" {}

locals {
  tags = {
    Name = var.alb-name
    Terraform = true
  }
}

resource "aws_alb" "web" {
  name               = var.alb-name
  idle_timeout       = 60  
  internal           = false
  load_balancer_type = "application"
  security_groups    = module.security-groups-lookup.compute-ids
  subnets            = module.network-lookup.public-subnet-ids

  access_logs {
    bucket  = var.s3-log-bucket
    enabled = true
    prefix  = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = local.tags
}

resource "aws_alb_listener" "https" {
  load_balancer_arn = aws_alb.web.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = module.cert.arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}