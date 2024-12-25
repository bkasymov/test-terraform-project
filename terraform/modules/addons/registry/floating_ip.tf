resource "vkcs_networking_floatingip" "registry_fip" {
  pool        = data.vkcs_networking_network.extnet.name
  description = "Floating IP for Docker Registry"
}