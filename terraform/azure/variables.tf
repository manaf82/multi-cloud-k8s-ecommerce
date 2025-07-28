variable "project_name" {
  description = "اسم المشروع"
  type        = string
  default     = "multi-cloud-ecommerce"
}

variable "environment" {
  description = "بيئة العمل"
  type        = string
  default     = "dev"
}

variable "azure_location" {
  description = "منطقة Azure"
  type        = string
  default     = "northeurope"
}

variable "cluster_name" {
  description = "اسم AKS cluster"
  type        = string
  default     = "multi-cloud-ecommerce-aks"
}

variable "cluster_version" {
  description = "إصدار Kubernetes"
  type        = string
  default = "1.30.12"
}

variable "node_count" {
  description = "عدد العقد"
  type        = number
  default     = 2
}

variable "node_vm_size" {
  description = "حجم Virtual Machines"
  type        = string
  default     = "Standard_B2s"
}
