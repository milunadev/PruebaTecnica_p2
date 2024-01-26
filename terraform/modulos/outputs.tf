output "public_ip_EC2" {
  value = aws_instance.Mongo_EC2.public_ip
}

output "public_subnet_ids" {
  value = data.aws_subnets.public.ids
}