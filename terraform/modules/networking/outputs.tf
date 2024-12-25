output "network_id" {
  description = "The ID of the network"
  value       = vkcs_networking_network.network.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = vkcs_networking_subnet.subnet.id
}

output "router_id" {
  description = "The ID of the router"
  value       = vkcs_networking_router.router.id
}