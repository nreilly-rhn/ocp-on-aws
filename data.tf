data "aws_availability_zones" "zones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_availability_zone" "zone" {
  for_each = toset(data.aws_availability_zones.zones.names)
  name = each.value
}