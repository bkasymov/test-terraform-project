resource "vkcs_networking_floatingip" "nginx_ingress_fip" {
  pool        = data.vkcs_networking_network.extnet.name
  description = "Floating IP for Nginx Ingress"
} 