variable "network_name" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "dns_nameservers" {
  type = list(string)
}
