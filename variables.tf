variable "aws_region" {
  type = string
  default = "ap-southeast-2"
}
variable "aws_access_key_id" {
  type = string
}
variable "aws_secret_access_key" {
  type = string
}
#variable "infra_name" {
#  type = string
#  default = "ocp"
#}
#variable "base_domain" {
#  type = string
#  default = "r53.naramajac.com.au"
#}
#variable "vpc_cidr" {
#  type = string
#  default = "10.0.0.0/16"
#}
#variable "ssh_pubkey" {
#  type = string
#}
#variable "pull_secret" {
#  type = any
#}