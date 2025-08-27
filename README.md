# CI Pipeline: Terraform + Ansible

This repo provisions two AWS VMs and configures them:
- **c8.local (Amazon Linux)** → frontend with nginx proxy
- **u21.local (Ubuntu 21.04)** → backend with Netdata on port 19999

## Steps

1. Configure AWS credentials on Jenkins or locally.
2. Update `terraform/main.tf` with your AWS keypair name.
3. Run pipeline in Jenkins.

## Expected Result
- `c8.local:80` (nginx) proxies requests → `u21.local:19999` (Netdata dashboard).
