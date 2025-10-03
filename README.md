# Terraform Azure Finance Project

## Project Overview
This project sets up a secure Ubuntu VM in Azure for a finance web application using Terraform. It includes:

- Provisioning Azure resources (VM, network, NSG, public IP) via Terraform
- Securing SSH access with key-based authentication
- Configuring UFW and NSG firewalls
- Installing and configuring Nginx as a web server
- Enabling HTTPS with a self-signed certificate

## Technologies Used
- Terraform (IaC)
- Azure Cloud
- Ubuntu 20.04 LTS
- Nginx
- SSH key authentication
- UFW and Azure NSG firewalls
- OpenSSL for self-signed certificates

## Instructions
1. Clone this repository
2. Configure your SSH key locally
3. Run `terraform init`, `terraform plan`, `terraform apply`
4. SSH into the VM to verify security and Nginx configuration
5. Update the VM as needed and maintain firewall rules

## Notes
- All firewall rules are managed in Terraform for repeatable, auditable deployments.
- HTTPS is enabled with a self-signed certificate; for production, replace with a CA-signed certificate.
- This project is for learning/testing purposes; follow additional security guidelines for production finance projects.

