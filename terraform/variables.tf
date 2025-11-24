variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "eastus"
}

variable "resource_group_name" {
  type        = string
  description = "Name of Resource Group"
}

variable "aks_cluster_name" {
  type        = string
  description = "AKS Cluster Name"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for AKS"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in AKS node pool"
  default     = 1
}

variable "node_vm_size" {
  type        = string
  description = "VM size for AKS nodes"
  default     = "Standard_B2s"
}

variable "vnet_name" {
  type        = string
  description = "Name of Virtual Network"
}

variable "subnet_name" {
  type        = string
  description = "Name of AKS subnet"
}
