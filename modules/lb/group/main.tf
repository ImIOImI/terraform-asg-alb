locals {
  http-name = var.name
}

data "aws_lb" "selected" {
  name = var.alb-name
}

data "aws_lb_listener" "https" {
  load_balancer_arn = data.aws_lb.selected.arn
  port              = 443
}

resource "aws_alb_target_group" "http" {
  name     = local.http-name
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.network-lookup.vpc-id

  tags = var.tags

  health_check {
    path = "/Default.aspx"
    port = 80
    healthy_threshold = 6
    unhealthy_threshold = 2
    timeout = 2
    interval = 5
    matcher = "200"  # has to be HTTP 200 or fails
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = [name]
  }
}

resource "aws_alb_listener_certificate" "cert" {
  listener_arn    = data.aws_lb_listener.https.arn
  certificate_arn = module.cert.arn
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = var.asg-id
  alb_target_group_arn   = aws_alb_target_group.http.arn
}