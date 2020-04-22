output "vpc-id" {
  value = data.aws_vpc.vpc.id
}
output "vpc-cidr" {
  value = data.aws_vpc.vpc.cidr_block
}
output "public-subnet-ids" {
  value = data.aws_subnet_ids.public.ids
}