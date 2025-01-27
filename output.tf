output "public_ip" {
  value = scaleway_instance_server.instance.*.public_ip
}

output "private_ip" {
  value = scaleway_instance_server.instance.*.private_ip
}

output "secgroup_id" {
 value = scaleway_instance_security_group.secgroup.id
}