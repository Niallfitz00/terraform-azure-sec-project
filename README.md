# Terraform + Ansible Azure Finance App Deployment

**Repository:** [Niallfitz00/terraform-azure-sec-project](https://github.com/Niallfitz00/terraform-azure-sec-project)  

This project demonstrates a secure, automated infrastructure deployment workflow for a finance web application on **Azure** using **Terraform** and **Ansible** with CI/CD best practices.

---

## Overview

We built a secure web VM in Azure with the following goals:

1. **Infrastructure as Code**: Terraform defines all cloud resources, ensuring repeatability and version control.
2. **Configuration Management**: Ansible handles the VM configuration, package installation, and hardening.
3. **Security-First Design**: SSH access restricted to a single IP, UFW firewall, disabled root login, and HTTPS enabled with self-signed certificates.
4. **CI/CD Workflow**: GitHub Actions automates infrastructure provisioning and configuration deployment.

---

## Architecture

Azure Subscription
└─ Resource Group (rg-finance-app-eastus)
├─ Virtual Network (vnet-finance-app)
│ └─ Subnet (subnet-web-tier)
│ └─ Network Security Group (nsg-web)
├─ Public IP (pip-finance-vm)
└─ Linux VM (vm-finance-web-01)
└─ Configured by Ansible: Nginx, UFW, HTTPS

**Key Decisions for Security:**

- **Restricted SSH Access**: Only your IP (`my_ip`) can SSH to the VM.
- **Firewall Rules**: UFW ensures only ports 22, 80, and 443 are reachable.
- **Ansible Hardening**: Disabled root login, disabled password auth, enabled firewall defaults, configured HTTPS.
- **Secrets Management**: No secrets (SSH keys, Azure credentials) are stored in the repository. GitHub Actions secrets are used securely.

---

## Terraform

Terraform files:

- `main.tf`: Defines resources including VM, VNet, Subnet, NSG, and Public IP.
- `variables.tf`: Variable definitions.
- `outputs.tf`: Outputs VM public IP and NSG name.
- `terraform.tfvars`: Example values for variables.

**Usage:**

```bash
terraform init
terraform plan
terraform apply
After apply, note the VM public IP from Terraform outputs:
terraform output vm_public_ip
terraform output nsg_name
Ansible
Ansible files:
ansible/inventory.ini: VM inventory with SSH user and key path.
ansible/setup.yml: Installs packages like Nginx.
ansible/hardening.yml: Secures the VM, enables firewall, HTTPS, and best practices.
Run Ansible Playbooks:
ansible -i ansible/inventory.ini all -m ping
ansible-playbook -i ansible/inventory.ini ansible/setup.yml
ansible-playbook -i ansible/inventory.ini ansible/hardening.yml
CI/CD
GitHub Actions workflow:
.github/workflows/deploy-infra.yml: Automates Terraform plan/apply and Ansible playbooks on push to main.
Secrets required:
AZURE_CLIENT_ID
AZURE_CLIENT_SECRET
AZURE_TENANT_ID
AZURE_SUBSCRIPTION_ID
SSH_PRIVATE_KEY
Workflow Purpose: Ensures repeatable, automated deployments without exposing credentials.
Security Notes
No credentials in the repo: All secrets managed through GitHub Actions secrets.
SSH key protection: Private key stays local, public key deployed to VM via Terraform.
Firewall and hardening: Only required ports open, root login disabled, password auth disabled.
HTTPS: Self-signed certificate for encrypted traffic (can be upgraded to CA-signed).
Verification
Check connectivity:
curl -k https://<VM_PUBLIC_IP>
nmap -p 22,80,443 <VM_PUBLIC_IP>
Expected results:
SSH (22) open
HTTP (80) open
HTTPS (443) open
Author
Niall Fitzgerald – Niallfitz00