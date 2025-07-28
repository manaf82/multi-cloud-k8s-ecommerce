output "cluster_id" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster.main.id
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = aws_eks_cluster.main.arn
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_security_group_id" {
  description = "Security group ID للـ EKS cluster"
  value       = aws_security_group.eks_cluster.id
}

output "kubectl_config" {
  description = "kubectl config command"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${var.cluster_name}"
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}
