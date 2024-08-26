resource "aws_security_group" "endpoints" {
  vpc_id = aws_vpc.vpc.id
    ingress {
    cidr_blocks = [ var.vpc_cidr ]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.aws_region}.s3"
  tags = {
    Name = join("-", [var.infra_name, "s3-endpoint"])
  }
}
resource "aws_vpc_endpoint" "ec2" {
  vpc_id = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.aws_region}.ec2"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids = [for subnet_id in aws_subnet.private : subnet_id.id]
  security_group_ids = [ aws_security_group.endpoints.id ]
  tags = {
    Name = join("-", [var.infra_name, "ec2-endpoint"])
  }
}
resource "aws_vpc_endpoint" "elb" {
  vpc_id = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.aws_region}.elasticloadbalancing"
  vpc_endpoint_type = "Interface"
  private_dns_enabled = true
  subnet_ids = [for subnet_id in aws_subnet.private : subnet_id.id]
  security_group_ids = [ aws_security_group.endpoints.id ]
  tags = {
    Name = join("-", [var.infra_name, "elb-endpoint"])
  }
}