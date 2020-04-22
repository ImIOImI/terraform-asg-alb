## Providers

| Name | Version |
|------|---------|
| aws | >= 2.38.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| compute-sg-tag | Put this tag on all security groups that a compute instance should have | `string` | `"Compute"` | no |
| default-vpc-tag | Put this tag on a single VPC that you want to deploy to | `string` | `"Default"` | no |
| domain | This is a domain that you have control over in Route53 | `string` | `"dev.example.com"` | no |
| environment | AWS Environment | `string` | `"dev"` | no |
| health-check-type | Determines if the auto scaling group uses an EC2 health check or an ELB health check | `string` | `"EC2"` | no |
| key-name | SSH key for the compute instance | `string` | `"AWS-DEV-WEB-PEM"` | no |
| public-subnet-tag | Put this tag on any subnets that the alb should have access to | `string` | `"Public"` | no |
| s3-log-bucket | this is a bucket that hold all the logs for the ALB | `string` | `"dev-example-logs"` | no |

## Outputs

No output.