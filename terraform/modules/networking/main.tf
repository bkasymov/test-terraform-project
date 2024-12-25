data "vkcs_networking_network" "extnet" {
  name = "internet"
}

resource "vkcs_networking_network" "network" {
  name           = var.network_name
  admin_state_up = true
}

resource "vkcs_networking_subnet" "subnet" {
  name            = "${var.network_name}-subnet"
  network_id      = vkcs_networking_network.network.id
  cidr            = var.subnet_cidr
  dns_nameservers = var.dns_nameservers
}

resource "vkcs_networking_router" "router" {
  name                = "${var.network_name}-router"
  admin_state_up      = true
  external_network_id = data.vkcs_networking_network.extnet.id
}

resource "vkcs_networking_router_interface" "router_interface" {
  router_id = vkcs_networking_router.router.id
  subnet_id = vkcs_networking_subnet.subnet.id
}