resource "vkcs_kubernetes_addon" "cert_manager" {
  cluster_id = var.cluster_id
  addon_id   = local.cert_manager_addon.id
  namespace  = "cert-manager"
} 