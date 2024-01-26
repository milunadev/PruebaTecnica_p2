output "public_ip_EC2" {
  value = module.AppMicroservicios.public_ip_EC2
}

output "public_subnet" {
  value = module.AppMicroservicios.public_subnet_ids
}