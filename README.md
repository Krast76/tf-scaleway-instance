# Terraform module for Scaleway instances

## Simplest usage as module

```
module "scw_instance" {
    source   = "git::https://github.com:Krast76/terraform-scaleway-instance.git"
    vm_numer = 1
    vm_name  = "test"
    vm_image = "0f44b130-2bc7-4f82-993e-de9d1042c56e"
    vm_tags  = ["Krast76", "Scaleway"]
}
```