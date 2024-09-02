#resource "aws_key_pair" "deployer" {
#  key_name   = "deployer-key"
#  public_key = var.ssh_pubkey
#}
#
#resource "aws_security_group" "bastion" {
#  description = "Bastion security group"
#  egress {
#    cidr_blocks = ["0.0.0.0/0"]
#    from_port   = "0"
#    protocol    = "-1"
#    self        = "false"
#    to_port     = "0"
#  }
#  ingress {
#    cidr_blocks = ["0.0.0.0/0"]
#    from_port   = "22"
#    protocol    = "tcp"
#    self        = "false"
#    to_port     = "22"
#  }
#  name   = "bastion-sg"
#  vpc_id = aws_vpc.vpc.id
#}
#resource "aws_instance" "bastion" {
#  ami                         = "ami-086918d8178bfe266"
#  associate_public_ip_address = "true"
#  availability_zone           = "ap-southeast-2a"
#  ebs_optimized               = "true"
#  instance_type               = "m5.xlarge"
#  key_name                    = "deployer-key"
#  metadata_options {
#    http_endpoint               = "enabled"
#    http_protocol_ipv6          = "disabled"
#    http_put_response_hop_limit = "2"
#    http_tokens                 = "required"
#    instance_metadata_tags      = "disabled"
#  }
#  private_dns_name_options {
#    enable_resource_name_dns_a_record    = "false"
#    enable_resource_name_dns_aaaa_record = "false"
#    hostname_type                        = "ip-name"
#  }
#  root_block_device {
#    delete_on_termination = "true"
#    encrypted             = "false"
#    iops                  = "3000"
#    throughput            = "125"
#    volume_size           = "10"
#    volume_type           = "gp3"
#  }
#  user_data = templatefile("${path.module}/userdata.sh", {
#    aws_region            = var.aws_region
#    aws_access_key_id     = var.aws_access_key_id
#    aws_secret_access_key = var.aws_secret_access_key
#    infra_name            = var.infra_name
#    base_domain           = var.base_domain
#    ssh_pubkey            = var.ssh_pubkey
#    pull_secret           = jsonencode(var.pull_secret)
#  })
#  source_dest_check = "true"
#  subnet_id         = aws_subnet.public[0].id
#  tags = {
#    Name = join("-", [var.infra_name, "seed"])
#  }
#  vpc_security_group_ids = [ aws_security_group.bastion.id ]
#}
