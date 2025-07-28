output "resource_group_name" {
  description = "اسم Resource Group"
  value       = azurerm_resource_group.main.name
}

output "cluster_name" {
  description = "اسم AKS cluster"
  value       = azurerm_kubernetes_cluster.main.name
}

output "cluster_endpoint" {
  description = "AKS cluster endpoint"
  value       = azurerm_kubernetes_cluster.main.kube_config.0.host
  sensitive = true
}

output "cluster_ca_certificate" {
  description = "AKS cluster CA certificate"
  value       = azurerm_kubernetes_cluster.main.kube_config.0.cluster_ca_certificate
  sensitive   = true
}

output "kube_config" {
  description = "kubectl config command"
  value       = "az aks get-credentials --resource-group ${azurerm_resource_group.main.name} --name ${azurerm_kubernetes_cluster.main.name}"
}

output "public_ip" {
  description = "Public IP للـ Load Balancer"
  value       = azurerm_public_ip.main.ip_address
}

output "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID"
  value       = azurerm_log_analytics_workspace.main.id
}
