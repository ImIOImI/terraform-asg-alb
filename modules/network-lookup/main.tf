data "aws_vpc" "vpc" {
  tags = {
    Default = true
  }
}

