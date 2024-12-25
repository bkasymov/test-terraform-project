data "vkcs_kubernetes_addons" "available_addons" {
  cluster_id = var.cluster_id
}

locals {
  cert_manager_addon = [
    for addon in data.vkcs_kubernetes_addons.available_addons.addons : addon
    if addon.name == "cert-manager" && addon.version == "1.12.2"
  ][0]
} 