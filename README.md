# Prepare environment

## export variables
```
export TF_VAR_aws_region=ap-southeast-2
export TF_VAR_aws_access_key_id=ABCDE12345
export TF_VAR_aws_secret_access_key=ABCDE12345
export TF_VAR_ssh_pubkey=ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/8VDoO4QUNtFTYCxLXBxaO+w4N5pKHTWEl
export TF_VAR_pull_secret={"auths":{"cloud.openshift.com":{"auth":"foo","email":"user@example.com"},"quay.io":{"auth":"foo","email":"user@example.com"},"registry.connect.redhat.com":{"auth":"bar","email":"user@example.com"},"registry.redhat.io":{"auth":"foobar","email":"user@example.com"}}}
export TF_VAR_base_domain=example.com
export TF_VAR_infra_name=ocp
export TF_VAR_vpc_cidr=10.0.0.16
```
## Or create terraform.tfvars.json
#### You may need to get creative with escaping the quotes in the pull secret like below
#### I haven't tested this method
#### It's probably preferable to export the vars as shown above
```
{
  "aws_region": "ap-southeast-2",
  "aws_access_key_id": "ABCDE12345",
  "aws_secret_access_key": "ABCDE12345",
  "ssh_pubkey": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/8VDoO4QUNtFTYCxLXBxaO+w4N5pKHTWEl",
  "pull_secret": "{\"auths\":{\"cloud.openshift.com\":{\"auth\":\"foo\",\"email\":\"user@example.com\"},\"quay.io\":{\"auth\":\"foo\",\"email\":\"user@example.com\"},\"registry.connect.redhat.com\":{\"auth\":\"bar\",\"email\":\"user@example.com\"},\"registry.redhat.io\":{\"auth\":\"foobar\",\"email\":\"user@example.com\"}}},",
  "base_domain": "example.com",
  "infra_name": "ocp",
  "vpc_cidr": "10.0.0.16"
}
```
# Run terraform
```
terraform init
terraform plan
terraform apply
```
