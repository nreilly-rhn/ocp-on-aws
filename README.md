# Prepare environment

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

# Run terraform
```
terraform init
terraform plan
terraform apply
```