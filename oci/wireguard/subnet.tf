resource "oci_core_vcn" "wireguard_vcn" {
  compartment_id = var.compartment_ocid
  display_name   = "wireguard_vcn"
  cidr_blocks    = ["10.0.1.0/24"]
  dns_label      = "wireguardvcn"
}

resource "oci_core_subnet" "wireguard_subnet" {
  compartment_id = var.compartment_ocid
  cidr_block     = "10.0.1.0/24"
  display_name   = "wireguard_subnet"
  dns_label      = "wireguardsubnet"
  vcn_id         = oci_core_vcn.wireguard_vcn.id
}


resource oci_core_internet_gateway wireguard_internet_gateway {
  compartment_id = var.compartment_ocid
  display_name   = "wireguard_internet_gateway"
  enabled        = "true"
  vcn_id         = oci_core_vcn.wireguard_vcn.id
}

resource oci_core_default_route_table wireguard_route_table {
  compartment_id             = var.compartment_ocid
  manage_default_resource_id = oci_core_vcn.wireguard_vcn.default_route_table_id
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.wireguard_internet_gateway.id
  }
}

resource oci_core_default_security_list wireguard_security_list {
  compartment_id             = var.compartment_ocid
  manage_default_resource_id = oci_core_vcn.wireguard_vcn.default_security_list_id
  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = "false"
  }
  ingress_security_rules {
    icmp_options {
      code = "4"
      type = "3"
    }
    protocol    = "1"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }
  ingress_security_rules {
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }
  ingress_security_rules {
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
    }
  }
  ingress_security_rules {
    protocol    = "17"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "true"
    udp_options {
      max = "51820"
      min = "51820"
    }
  }
}