locals {
  disks_map = { for disk in var.virtual_disks : disk.name => disk }
}

resource "vkcs_blockstorage_volume" "disk" {
  for_each          = local.disks_map
  name              = each.value.name
  description       = each.value.description
  metadata          = each.value.metadata
  size              = each.value.size
  availability_zone = each.value.availability_zone
  volume_type       = each.value.volume_type
}