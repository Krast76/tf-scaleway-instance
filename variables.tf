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

variable "vm_disable_dynamic_ip" {
  type    = bool
  default = true
}

variable "vm_public_ip" {
  type    = string
  default = null
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
  type        = map
  description = "List of map for user_data"
  default     = {}
}

variable "vm_inbound_rule" {
  type = list(map(string))
  default = [{
    action   = "accept"
    port     = 22
    ip_range = "0.0.0.0/0"
  }]
}

variable "vm_outbound_rule" {
  type = list(map(string))
  default = [{
    action   = "accept"
    protocol = "ICMP"
    },
    {
      action   = "accept"
      protocol = "UDP"
    },
    {
      action = "accept"
    }
  ]
}
