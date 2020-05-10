output "public_ip" {
    value = scaleway_instance_server.instance.*.public_ip
}

output "private_ip" {
    value = scaleway_instance_server.instance.*.private_ip
}