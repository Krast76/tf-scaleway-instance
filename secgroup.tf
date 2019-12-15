resource "scaleway_instance_security_group" "secgroup" {
  name = "${var.vm_name}-secgroup"

  inbound_default_policy  = "drop"
  outbound_default_policy = "drop"

  dynamic "inbound_rule" {
    iterator = rule
    for_each = [for rule in var.vm_inbound_rule : merge({
      action   = null
      protocol = "TCP"
      port     = null
      ip       = null
      ip_range = null
    }, rule)]

    content {
      action   = rule.value.action
      protocol = rule.value.protocol
      port     = rule.value.port
      ip       = rule.value.ip
      ip_range = rule.value.ip_range
    }
  }

  dynamic "outbound_rule" {
    iterator = rule
    for_each = [for rule in var.vm_outbound_rule : merge({
      action   = null
      protocol = "TCP"
      port     = null
      ip       = null
      ip_range = null
    }, rule)]

    content {
      action   = rule.value.action
      protocol = rule.value.protocol
      port     = rule.value.port
      ip       = rule.value.ip
      ip_range = rule.value.ip_range
    }

  }
}
