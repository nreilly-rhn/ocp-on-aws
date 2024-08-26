provider "aws" {
  region                 = var.aws_region
  access_key             = var.aws_access_key_id
  secret_key             = var.aws_secret_access_key
  skip_region_validation = true
}

terraform {
	required_providers {
		aws = {
	    version = "~> 5.62.0"
		}
  }
}