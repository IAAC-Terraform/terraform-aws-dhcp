variable "name" {}

variable "env" {}

variable "vpc_id" {}

variable "create_vpc" {}

variable "enable_dhcp_options" {}

variable "domain_name" {}

variable "domain_name_servers" {
    type = "list"
}

variable "ntp_servers" {
    type = "list"
}

variable "netbios_name_servers" {
    type = "list"
}

variable "netbios_node_type" {}

