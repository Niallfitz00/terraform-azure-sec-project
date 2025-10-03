variable "location" {
  type    = string
  default = "East US"
}

variable "rg_name" {
  type    = string
  default = "rg-finance-app-eastus"
}

variable "vnet_name" {
  type    = string
  default = "vnet-finance-app"
}

variable "subnet_name" {
  type    = string
  default = "subnet-web-tier"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}

variable "admin_username" {
  type    = string
  default = "financeadmin"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "my_ip" {
  type        = string
  description = "Your public IP address for SSH access, e.g., 1.2.3.4/32"
}
