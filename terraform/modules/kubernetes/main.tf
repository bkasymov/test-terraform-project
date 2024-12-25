# Start of Selection
resource "vkcs_kubernetes_cluster" "k8s-cluster" {
  name                = var.cluster_name
  cluster_template_id = data.vkcs_kubernetes_clustertemplate.k8s_24.id
  cluster_type        = var.cluster_type
  master_flavor       = data.vkcs_compute_flavor.k8s-master-flavor.id
  master_count        = var.master_count
  network_id          = var.network_id
  subnet_id           = var.subnet_id
  availability_zone   = var.availability_zone
  floating_ip_enabled = var.floating_ip_enabled
  labels = {
    docker_registry_enabled = true
    docker_registry_ingress_enabled = true
  }

  timeouts {
    create = "60m"
    update = "60m"
    delete = "60m"
  }
}

resource "vkcs_kubernetes_node_group" "k8s-node-group" {
  name                = "${var.cluster_name}-node-group"
  cluster_id          = vkcs_kubernetes_cluster.k8s-cluster.id
  flavor_id           = data.vkcs_compute_flavor.k8s-node-group-flavor.id
  node_count          = var.node_count
  autoscaling_enabled = false
  min_nodes           = var.min_nodes
  max_nodes           = var.max_nodes
  
  labels {
        key   = "env"
        value = var.environment
    }
  labels {
        key   = "disktype"
        value = var.disk_type
    }

  timeouts {
    create = "60m"
    update = "60m"
    delete = "60m"
  }

  depends_on = [
    vkcs_kubernetes_cluster.k8s-cluster
  ]
}