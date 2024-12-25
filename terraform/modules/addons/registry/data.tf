data "vkcs_networking_network" "extnet" {
  name = var.extnet_name
}

data "vkcs_kubernetes_cluster" "cluster" {
  name = var.cluster_name
}

data "vkcs_kubernetes_addon" "registry" {
  cluster_id = var.cluster_id
  name       = "docker-registry"
  version    = var.registry_version

  depends_on = [
    data.vkcs_kubernetes_cluster.cluster
  ]
} 