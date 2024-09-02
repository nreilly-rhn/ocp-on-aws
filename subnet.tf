#locals {
#  _subnets   = cidrsubnets(var.vpc_cidr, 4, 4, 4, 4, 4, 4)
#}
#
#resource "aws_subnet" "public" {
#  count                   = "${length(data.aws_availability_zones.zones.names)}"
#  vpc_id                  = aws_vpc.vpc.id
#  cidr_block              = local._subnets[count.index]
#  availability_zone       = "${data.aws_availability_zones.zones.names[count.index]}"
#  map_public_ip_on_launch = false
#  tags = {
#    Name = join("-", [var.infra_name, "public", "${data.aws_availability_zones.zones.names[count.index]}"])
#  }
#}
#
#resource "aws_subnet" "private" {
#  count                   = "${length(data.aws_availability_zones.zones.names)}"
#  vpc_id                  = aws_vpc.vpc.id
#  cidr_block              = local._subnets[count.index + length(data.aws_availability_zones.zones.names)]
#  availability_zone       = "${data.aws_availability_zones.zones.names[count.index]}"
#  map_public_ip_on_launch = false
#  tags = {
#    Name = join("-", [var.infra_name, "private", "${data.aws_availability_zones.zones.names[count.index]}"])
#  }
#}
#
#resource "aws_internet_gateway" "internet_gateway" {
#  vpc_id = aws_vpc.vpc.id
#  tags = {
#    Name = join("-", [var.infra_name, "internet_gateway"])
#  }
#}
#
#resource "aws_eip" "eip" {
#  depends_on = [ aws_internet_gateway.internet_gateway ]
#}
#
#resource "aws_nat_gateway" "nat_gateway" {
#  allocation_id                      = aws_eip.eip.allocation_id
#  connectivity_type                  = "public"
#  subnet_id                          = "${aws_subnet.public[0].id}"
#  tags = {
#    Name = join("-", [var.infra_name, "nat_gateway"])
#  }
#  depends_on = [ aws_eip.eip ]
#}
#
#resource "aws_route_table" "public" {
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.internet_gateway.id
#  }
#  tags = {
#    Name = join("-", [var.infra_name, "rtb-public"])
#  }
#  vpc_id = aws_vpc.vpc.id
#}
#
#resource "aws_route_table" "private" {
#  count  = "${length(data.aws_availability_zones.zones.names)}"
#  vpc_id = aws_vpc.vpc.id
#  route {
#    cidr_block     = "0.0.0.0/0"
#    nat_gateway_id = aws_nat_gateway.nat_gateway.id
#  }
#  tags = {
#    Name = join("-", [var.infra_name, "rtb", "private", "${data.aws_availability_zones.zones.names[count.index]}"])
#  }
#}
#
#resource "aws_route_table_association" "private_rtb_association" {
#  count = "${length(data.aws_availability_zones.zones.names)}"
#  subnet_id       = "${element(aws_subnet.private.*.id, count.index)}"
#  route_table_id  = "${element(aws_route_table.private.*.id, count.index)}"
#}
#
#resource "aws_route_table_association" "public_rtb_association" {
#  count = "${length(data.aws_availability_zones.zones.names)}"
#  subnet_id       = "${element(aws_subnet.public.*.id, count.index)}"
#  route_table_id  = aws_route_table.public.id
#}