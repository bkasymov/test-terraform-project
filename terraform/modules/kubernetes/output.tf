output "kubeconfig" {
  value = vkcs_kubernetes_cluster.k8s-cluster.k8s_config
  sensitive = true
}

output "disk-postgres" {
  description = "ID of disk for postgres storage pod"
  value       = vkcs_blockstorage_volume.disk["sc-postgres"].id
}

output "disk-mongodb" {
  description = "ID of disk for mongodb storage pod"
  value       = vkcs_blockstorage_volume.disk["sc-mongodb"].id
}

output "available_addons" {
  description = "Available addons"
  value       = data.vkcs_kubernetes_addons.addons.addons
}

output "cluster_id" {
  description = "ID of the Kubernetes cluster"
  value       = vkcs_kubernetes_cluster.k8s-cluster.id
}

resource "local_file" "kubeconfig" {
  content  = vkcs_kubernetes_cluster.k8s-cluster.k8s_config
  filename = pathexpand("~/.kube/vkcloud_config")
  file_permission = "0600"
  depends_on = [vkcs_kubernetes_node_group.k8s-node-group]
}
