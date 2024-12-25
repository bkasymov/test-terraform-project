# Создаем базовую security group для кластера
resource "vkcs_networking_secgroup" "k8s_secgroup" {
  name        = "${var.cluster_name}-k8s-secgroup"
  description = "Security group for Kubernetes cluster"
}

# Разрешаем весь исходящий трафик
resource "vkcs_networking_secgroup_rule" "k8s_secgroup_rule_egress" {
  direction         = "egress"
  protocol         = "tcp"
  port_range_min   = 1
  port_range_max   = 65535
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = vkcs_networking_secgroup.k8s_secgroup.id
}

# Разрешаем входящий трафик для API и сервисов
resource "vkcs_networking_secgroup_rule" "k8s_secgroup_rule_ingress" {
  direction         = "ingress"
  protocol         = "tcp"
  port_range_min   = 1
  port_range_max   = 65535
  remote_ip_prefix = "0.0.0.0/0"
  security_group_id = vkcs_networking_secgroup.k8s_secgroup.id
} 