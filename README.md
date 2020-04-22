## Intro

This module creates 
1) a compute instance launch configuration
2) an autoscaling group
3) an application load balancer
4) listeners on both port 80 and 443
5) a target group per autoscaling group
6) listener rules to forward traffic to the relevant autoscaling groups based on their domain

You can add additional compute instances in their own autoscaling groups with different domains by copying and pasting the compute instance in main.tf. An additional target group will be created and listener rules will be added to the alb-01's listeners forwarding traffic to the new autoscaling group. 

## Requirements

This module assumes you have a vpc, security groups, and public subnets already available that you would like to deploy into. By default the data queries will be looking for a key named `Default` with a value of `true`. Once those are found, Terraform will deploy into the relevant vpc/subnet and attach the tagged security groups (please remember you can add up to 5). All these tags are variables that can be overriden as seen on the table below.  

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.38.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| compute-sg-tag | Put this tag on all security groups that a compute instance should have | `string` | `"Default"` | no |
| default-vpc-tag | Put this tag on a single VPC that you want to deploy to | `string` | `"Default"` | no |
| domain | This is a domain that you have control over in Route53 | `string` | `"dev.example.com"` | no |
| environment | AWS Environment | `string` | `"dev"` | no |
| health-check-type | Determines if the auto scaling group uses an EC2 health check or an ELB health check | `string` | `"EC2"` | no |
| key-name | SSH key for the compute instance | `string` | `"AWS-DEV-WEB-PEM"` | no |
| public-subnet-tag | Put this tag on any subnets that the alb should have access to | `string` | `"Default"` | no |
| s3-log-bucket | this is a bucket that hold all the logs for the ALB | `string` | `"dev-example-logs"` | no |

## Outputs

No output.