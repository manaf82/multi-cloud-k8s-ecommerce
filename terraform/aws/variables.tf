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

variable "aws_region" {
  description = "منطقة AWS"
  type        = string
  default     = "eu-central-1"
}

variable "cluster_name" {
  description = "اسم EKS cluster"
  type        = string
  default     = "multi-cloud-ecommerce-eks"
}

variable "cluster_version" {
  description = "إصدار Kubernetes"
  type        = string
  default     = "1.30"  
}

variable "node_instance_types" {
  description = "أنواع instances للعقد"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_capacity" {
  description = "العدد المطلوب للعقد"
  type        = number
  default     = 2
}

variable "node_min_capacity" {
  description = "الحد الأدنى للعقد"
  type        = number
  default     = 1
}

variable "node_max_capacity" {
  description = "الحد الأقصى للعقد"
  type        = number
  default     = 4
}
