variable "vm_image" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_type" {
  type    = string
  default = "DEV1-M"
}

variable "vm_number" {
  type    = number
  default = 1
}

variable "vm_zone" {
  type    = string
  default = "fr-par-1"
}
variable "vm_tags" {
  type    = list
  default = []
}

variable "vm_secgroup" {
  type    = string
  default = ""
}

variable "vm_pg" {
  type        = string
  description = "Placement Group of the VM"
  default     = ""
}

variable "vm_user_data" {
  type = list
  description = "List of map for user_data"
  default = []
}
