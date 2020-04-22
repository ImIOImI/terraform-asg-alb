variable "alb-name" {}
variable "compute-url" {
  description = "The url that we will be routing requests to"
}

data "aws_lb" "selected" {
  name = var.alb-name
}

data "aws_lb_listener" "https" {
  load_balancer_arn = data.aws_lb.selected.arn
  port              = 443
}

data "aws_lb_listener" "http" {
  load_balancer_arn = data.aws_lb.selected.arn
  port              = 80
}

data "aws_alb_target_group" "group" {
  name = "listen-${var.alb-name}"
}

resource "aws_lb_listener_rule" "host_based_routing" {
  listener_arn = data.aws_lb_listener.https
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = data.aws_alb_target_group.group.arn
  }

  condition {
    host_header = {
      values = [var.compute-url]
    }
  }
}

resource "aws_lb_listener_rule" "host_based_routing" {
  listener_arn = data.aws_lb_listener.http
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = data.aws_alb_target_group.group.arn
  }

  condition {
    host_header = {
      values = [var.compute-url]
    }
  }
}