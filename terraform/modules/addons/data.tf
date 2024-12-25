data "vkcs_networking_network" "extnet" {
  name = var.extnet_name
}

data "vkcs_kubernetes_addon" "nginx_ingress" {
  cluster_id = var.cluster_id
  name = "ingress-nginx"
  version = "4.10.1"
}

data "vkcs_kubernetes_addon" "registry" {
  cluster_id = var.cluster_id
  name       = "docker-registry"
  version    = var.registry_version
}

data "vkcs_kubernetes_addons" "cluster_addons" {
  cluster_id = var.cluster_id
}