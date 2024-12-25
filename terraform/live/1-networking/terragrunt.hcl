include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/networking"
}

inputs = {
  network_name    = "test-net"
  subnet_cidr     = "192.168.199.0/24"
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
}