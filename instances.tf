locals {
  volumes = {
    for v in var.additional_volumes:
    v.name => v
  }
}

resource "scaleway_instance_server" "instance" {
  count = var.vm_number

  type               = var.vm_type
  image              = var.vm_image
  name               = "${var.vm_name}-${count.index}"
  tags               = var.vm_tags
  security_group_id  = scaleway_instance_security_group.secgroup.id
  placement_group_id = var.vm_pg
  enable_dynamic_ip  = var.vm_disable_dynamic_ip
  ip_id              = var.vm_public_ip

  dynamic "user_data" {
    iterator = data
    for_each = var.vm_user_data
    content {
      key   = data.key
      value = data.value
    }
  }

  additional_volume_ids = [for v in scaleway_instance_volume.server_volume: v.id]
}

resource "scaleway_instance_volume" "server_volume" {
  count = var.vm_number
  for_each = local.volumes 

  name = each.value.name 
  type = lookup(each.value, "type", "b_ssd") 
  size_in_gb = lookup(each.value, "size", 1)
}
