#!/bin/env bash

curl --output /tmp/openshift-client-linux.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.14.9/openshift-client-linux.tar.gz
curl --output /tmp/openshift-install-linux.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/4.14.9/openshift-install-linux.tar.gz

tar xzvf /tmp/openshift-install-linux.tar.gz -C /usr/local/bin --exclude README.md
tar xzvf /tmp/openshift-client-linux.tar.gz -C /usr/local/bin --exclude README.md
dnf install -y unzip
curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip --output awscliv2.zip
unzip awscliv2.zip
./aws/install

# mkdir /opt/ocp-install
# 
# cat <<EOF > /opt/ocp-install/.aws.env
# export aws_region=${aws_region}
# export aws_access_key_id=${aws_access_key_id}
# export aws_secret_access_key=${aws_secret_access_key}
# EOF
# source /opt/ocp-install/.aws.env
# cat <<EOF > /opt/ocp-install/.ocp.env
# export aws_region=${aws_region}
# export AZS=$(aws ec2 describe-availability-zones |jq -r '[.AvailabilityZones[].ZoneName] |@text')
# export SUBNETS=$(aws ec2 describe-subnets |jq -r '[.Subnets[].SubnetId] |@text')
# EOF
# source /opt/ocp-install/.ocp.env
# 
# cat <<EOF > /opt/ocp-install/install-config.yaml
# additionalTrustBundlePolicy: Proxyonly
# apiVersion: v1
# baseDomain: ${base_domain}
# metadata:
#   name: ${infra_name}
# compute:
# - architecture: amd64
#   hyperthreading: Enabled
#   name: worker
#   platform:
#     aws:
#       rootVolume:
#         iops: 2000
#         size: 500
#         type: io1 
#       metadataService:
#         authentication: Optional
#       type: c5.xlarge
#       zones: $(aws ec2 describe-availability-zones |jq -r '[.AvailabilityZones[].ZoneName] |@text')
#   replicas: 3
# controlPlane:
#   architecture: amd64
#   hyperthreading: Enabled
#   name: master
#   platform:
#     aws:
#       zones: $(aws ec2 describe-availability-zones |jq -r '[.AvailabilityZones[].ZoneName] |@text')
#       rootVolume:
#         iops: 4000
#         size: 500
#         type: io1 
#       metadataService:
#         authentication: Optional
#       type: m6i.xlarge
#   replicas: 3
# networking:
#   clusterNetwork:
#   - cidr: 10.128.0.0/14
#     hostPrefix: 23
#   machineNetwork:
#   - cidr: 10.0.0.0/16
#   networkType: OVNKubernetes
#   serviceNetwork:
#   - 172.30.0.0/16
# platform:
#   aws:
#     region: ${aws_region}
#     subnets: $(aws ec2 describe-subnets |jq -r '[.Subnets[].SubnetId] |@text')
# publish: External
# sshKey: ${ssh_pubkey}
# pullSecret: ${pull_secret}
# EOF