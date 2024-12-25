output "nginx_ingress_endpoint" {
  description = "Nginx Ingress endpoint"
  value       = vkcs_networking_floatingip.nginx_ingress_fip.address
}

output "addon_id" {
  description = "ID of the Nginx Ingress addon"
  value       = vkcs_kubernetes_addon.nginx_ingress.id
} 