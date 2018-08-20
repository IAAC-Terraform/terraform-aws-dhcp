resource "aws_vpc_dhcp_options" "dhcpoptionset" {
  count                = "${var.create_vpc && var.enable_dhcp_options ? 1 : 0}"
  domain_name          = "${var.domain_name}"
  domain_name_servers  = ["${var.domain_name_servers}"]
  ntp_servers          = ["${var.ntp_servers}"]
  netbios_name_servers = ["${var.netbios_name_servers}"]
  netbios_node_type    = "${var.netbios_node_type}"

  tags {
    Name = "${var.name}-0${count.index + 1}"
    env  = "${var.env}"
  }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  count           = "${var.create_vpc && var.enable_dhcp_options ? 1 : 0}"
  vpc_id          = "${var.vpc_id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.dhcpoptionset.id}"
}
