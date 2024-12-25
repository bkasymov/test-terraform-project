include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/kubernetes"
}

dependency "networking" {
  config_path = "../1-networking"
}

# CPU 4 RAM 16

inputs = {
  availability_zone   = "MS1"
  cluster_name        = "test-project-vkcs"
  cluster_type        = "standard"
  disk_type           = "ssd"
  virtual_disks       = [
    {
      name              = "sc-mongodb"
      description       = "StorageClass for MongoDB"
      size              = 10
      metadata          = null
      availability_zone = "GZ1"
      volume_type       = "ceph-ssd"
    },
    {
      name              = "sc-postgres"
      description       = "StorageClass for PostgreSQL"
      size              = 2
      metadata          = null
      availability_zone = "GZ1"
      volume_type       = "ceph-ssd"
    },
  ]
  environment         = "dev"
  floating_ip_enabled = true
  kubernetes_version  = "1.29"
  master_count        = 1
  master_flavor       = "STD3-2-8" # CPU 4 RAM 16
  max_nodes           = 3
  min_nodes           = 1
  network_id          = dependency.networking.outputs.network_id
  node_count          = 1
  node_group_flavor   = "STD2-2-4" # CPU 4 RAM 16
  subnet_id           = dependency.networking.outputs.subnet_id
}
