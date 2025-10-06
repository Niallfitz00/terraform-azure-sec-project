# Terraform Azure Security Project

## Overview

I built a secure finance web VM environment in Azure using **Terraform** for infrastructure provisioning and **Ansible** for configuration management. Security has been the primary focus at every stage of this project.

This project demonstrates how to:

- Create Azure resources (VMs, networking, public IPs) with Terraform.
- Configure Linux VMs, install Nginx, and enforce security hardening using Ansible.
- Implement a **CI/CD workflow template** in GitHub Actions for automated deployments, keeping credentials secure.

> **Note:** Due to tenant access restrictions, the GitHub Actions workflow cannot run automatically. I have included it as a template; all deployments in this project were performed manually.

---

## Architecture & Decisions

### Networking & Security

- I created a **Virtual Network (VNet)** and a **subnet** for the web tier.
- A **Network Security Group (NSG)** is applied to control access:
  - SSH is allowed only from my public IP.
  - HTTP and HTTPS ports are open for web traffic.
- I assigned a **static public IP** to the VM for consistent access.
- Security best practices such as restricting SSH to specific IPs and using key-based authentication were enforced.

### Virtual Machine

- I provisioned an **Ubuntu 20.04 VM**.
- The VM is configured with **SSH key authentication only** (no passwords) to reduce attack surface.
- Nginx was installed and configured using **Ansible**.

### Security Hardening (Ansible)

- **SSH hardening**: root login disabled, password authentication disabled.
- **Firewall (UFW)** configured:
  - Deny all incoming traffic by default.
  - Allow outgoing traffic.
  - Explicitly allow SSH, HTTP, and HTTPS.
- **HTTPS enabled** on Nginx using a self-signed certificate and DH parameters.
- All tasks were idempotent to ensure consistent configuration.

---

## Terraform

Terraform is used to provision Azure resources in a repeatable and auditable manner:

- Resource Group
- Virtual Network
- Subnet
- Network Security Group
- Public IP
- Network Interface
- Linux VM

**Outputs**:

```hcl
nsg_name = "nsg-web"
vm_public_ip = "20.39.42.47"
These outputs are helpful for connecting to the VM and referencing resources in Ansible playbooks.
Ansible
I used Ansible to:
Configure the VM after creation.
Install and start Nginx.
Apply security hardening rules.
Enable HTTPS using self-signed certificates.
The inventory file ansible/inventory.ini contains the VM’s IP and SSH credentials (key path) kept locally and never committed to GitHub.
GitHub Actions CI/CD Workflow
The workflow is defined in .github/workflows/deploy-infra.yml.
Intended steps:
Checkout the repository.
Set up SSH agent for secure connections.
Set up Terraform and apply infrastructure.
Install Ansible and run playbooks to configure VMs.
Important: This workflow will fail in this repository because I do not have access to the tenant secrets required to run Terraform against Azure automatically. The workflow is a template to demonstrate the CI/CD approach while keeping credentials safe.
Security Considerations
No credentials, keys, or sensitive information are exposed in this repository.
All SSH keys used locally are kept secure and never committed.
Azure secrets (client ID, tenant ID, subscription ID) are required for automation but are stored securely as GitHub secrets in a private environment.
Firewall rules and SSH hardening enforce least privilege and reduce attack surface.
Manual Steps Taken
Provisioned Azure infrastructure with Terraform locally.
Configured VM with Ansible.
Verified services (Nginx, SSH, HTTPS) were running correctly.
Tested connectivity and security rules with nmap and curl.
Documented the workflow and outputs in GitHub for reference.
Next Steps
Once proper Azure tenant access is available, the GitHub Actions workflow can be fully enabled.
Replace self-signed certificates with trusted certificates for production.
Extend Ansible playbooks to include application deployment.

---

This is **ready to paste into VSCode** as `README.md`. It will render cleanly with headings, code blocks, and bullet points.  

If you want, I can also **write the exact Git commands** to commit and push this updated README safely to GitHub. Do you want me to do that next?# Terraform Azure Security Project

## Overview

I built a secure finance web VM environment in Azure using **Terraform** for infrastructure provisioning and **Ansible** for configuration management. Security has been the primary focus at every stage of this project.

This project demonstrates how to:

- Create Azure resources (VMs, networking, public IPs) with Terraform.
- Configure Linux VMs, install Nginx, and enforce security hardening using Ansible.
- Implement a **CI/CD workflow template** in GitHub Actions for automated deployments, keeping credentials secure.

> **Note:** Due to tenant access restrictions, the GitHub Actions workflow cannot run automatically. I have included it as a template; all deployments in this project were performed manually.

---

## Architecture & Decisions

### Networking & Security

- I created a **Virtual Network (VNet)** and a **subnet** for the web tier.
- A **Network Security Group (NSG)** is applied to control access:
  - SSH is allowed only from my public IP.
  - HTTP and HTTPS ports are open for web traffic.
- I assigned a **static public IP** to the VM for consistent access.
- Security best practices such as restricting SSH to specific IPs and using key-based authentication were enforced.

### Virtual Machine

- I provisioned an **Ubuntu 20.04 VM**.
- The VM is configured with **SSH key authentication only** (no passwords) to reduce attack surface.
- Nginx was installed and configured using **Ansible**.

### Security Hardening (Ansible)

- **SSH hardening**: root login disabled, password authentication disabled.
- **Firewall (UFW)** configured:
  - Deny all incoming traffic by default.
  - Allow outgoing traffic.
  - Explicitly allow SSH, HTTP, and HTTPS.
- **HTTPS enabled** on Nginx using a self-signed certificate and DH parameters.
- All tasks were idempotent to ensure consistent configuration.

---

## Terraform

Terraform is used to provision Azure resources in a repeatable and auditable manner:

- Resource Group
- Virtual Network
- Subnet
- Network Security Group
- Public IP
- Network Interface
- Linux VM

**Outputs**:

```hcl
nsg_name = "nsg-web"
vm_public_ip = "20.39.42.47"
These outputs are helpful for connecting to the VM and referencing resources in Ansible playbooks.
Ansible
I used Ansible to:
Configure the VM after creation.
Install and start Nginx.
Apply security hardening rules.
Enable HTTPS using self-signed certificates.
The inventory file ansible/inventory.ini contains the VM’s IP and SSH credentials (key path) kept locally and never committed to GitHub.
GitHub Actions CI/CD Workflow
The workflow is defined in .github/workflows/deploy-infra.yml.
Intended steps:
Checkout the repository.
Set up SSH agent for secure connections.
Set up Terraform and apply infrastructure.
Install Ansible and run playbooks to configure VMs.
Important: This workflow will fail in this repository because I do not have access to the tenant secrets required to run Terraform against Azure automatically. The workflow is a template to demonstrate the CI/CD approach while keeping credentials safe.
Security Considerations
No credentials, keys, or sensitive information are exposed in this repository.
All SSH keys used locally are kept secure and never committed.
Azure secrets (client ID, tenant ID, subscription ID) are required for automation but are stored securely as GitHub secrets in a private environment.
Firewall rules and SSH hardening enforce least privilege and reduce attack surface.
Manual Steps Taken
Provisioned Azure infrastructure with Terraform locally.
Configured VM with Ansible.
Verified services (Nginx, SSH, HTTPS) were running correctly.
Tested connectivity and security rules with nmap and curl.
Documented the workflow and outputs in GitHub for reference.
Next Steps
Once proper Azure tenant access is available, the GitHub Actions workflow can be fully enabled.
Replace self-signed certificates with trusted certificates for production.
Extend Ansible playbooks to include application deployment.

---

This is **ready to paste into VSCode** as `README.md`. It will render cleanly with headings, code blocks, and bullet points.  

If you want, I can also **write the exact Git commands** to commit and push this updated README safely to GitHub. Do you want me to do that next?