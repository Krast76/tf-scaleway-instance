resource "scaleway_instance_server" "instance" {
  count              = "${var.vm_number}"
  type               = "${var.vm_type}"
  image              = "${var.vm_image}"
  name               = "${var.vm_name}-${count.index}"
  tags               = "${var.vm_tags}"
  security_group_id  = "${var.vm_secgroup}"
  placement_group_id = "${var.vm_pg}"
  zone               = "${var.vm_zone}"

  dynamic "user_data" {
    iterator = data
    for_each = var.vm_user_data
    content {
      key = data.key
      value = data.value
    }
  }
}
