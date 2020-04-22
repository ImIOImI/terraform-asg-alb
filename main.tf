provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile = "Stage"
  version = ">= 2.38.0"
}

data "aws_ami" "ami" {
  most_recent = true
  owners = ["591542846629"] # AWS

  filter {
    name   = "name"
    values = ["*amazon-ecs-optimized"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "alb" {
  source = "./modules/lb/alb"
  alb-name = "alb-01"
  compute-tag = var.compute-sg-tag
  domain = var.domain
  environment = var.environment
  public-subnet-tag = var.public-subnet-tag
  s3-log-bucket = var.s3-log-bucket
  default-vpc-tag = var.default-vpc-tag
}

module "compute01" {
  source = "./modules/compute"
  instance = "t2.small"
  name = "compute01"
  alb-name = module.alb.alb-name
  ami = data.aws_ami.ami.id
  priority = 1
  asg_depends_on = [module.alb]
  compute-tag = var.compute-sg-tag
  domain = var.domain
  environment = var.environment
  health-check-type = var.health-check-type
  key-name = var.key-name
  public-subnet-tag = var.public-subnet-tag
  default-vpc-tag = var.default-vpc-tag
}