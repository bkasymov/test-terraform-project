data "vkcs_compute_flavor" "k8s-master-flavor" {
    name = var.master_flavor
}

data "vkcs_compute_flavor" "k8s-node-group-flavor" {
    name = var.node_group_flavor
}

data "vkcs_kubernetes_clustertemplate" "k8s_24" {
    version = var.kubernetes_version
}

data "vkcs_networking_network" "extnet" {
  name = "internet"
}

# List all available addons
data "vkcs_kubernetes_addons" "addons" {
    cluster_id = vkcs_kubernetes_cluster.k8s-cluster.id
}

data "vkcs_kubernetes_cluster" "cluster" {
  name = var.cluster_name

  depends_on = [
    vkcs_kubernetes_cluster.k8s-cluster
  ]
}