output "availability_zones" {
  value = data.aws_availability_zones.zones
}
#output "bastion" {
#    value = aws_instance.bastion.public_dns
#}