# Terraform module for Scaleway instances

## Simplest usage as module

```
module "scw_instance" {
    source   = "git::https://github.com:Krast76/terraform-scaleway-instance.git"
    vm_numer = 1
    vm_name  = "test"
    vm_image = "0f44b130-2bc7-4f82-993e-de9d1042c56e"
    vm_tags  = ["Krast76", "Scaleway"]
    vm_user_data = {"Foo"="Bar"}
}
```

## Security Group
If no security group rules are setup only the 22 port is open

```
locals {
    secgroup_in = [
        {
            action = "accept"
            port = "22"
            ip_range = "0.0.0.0/0"
        },
        {
            action = "accept"
            port = "80"
            ip_range = "0.0.0.0/0"
        },
        {
            action = "accept"
            port = "80"
            ip_range = "0.0.0.0/0"
        }
    ]
}
module "scw_instance" {
    source   = "git::https://github.com:Krast76/terraform-scaleway-instance.git"
    vm_numer = 1
    vm_name  = "test"
    vm_image = "0f44b130-2bc7-4f82-993e-de9d1042c56e"
    vm_inbound_rule = "${local.secgroup_in}"
}
```