variable "compartment_ocid" {
  default = "ocid1.tenancy.oc1..aaaaaaaauf7mfoaww3jv34m57dcbjo6jxjn737gn3nwzfi6vbfeuwsvajnkq"
}

data "oci_identity_availability_domain" "wireguard_ad" {
  compartment_id = var.compartment_ocid
  ad_number      = "1"
}

resource "oci_core_instance" "wireguard_us_instance" {
  compartment_id      = var.compartment_ocid
  display_name        = "wireguard_us_instance"
  availability_domain = data.oci_identity_availability_domain.wireguard_ad.name
  availability_config {
    recovery_action             = "RESTORE_INSTANCE"
    is_live_migration_preferred = false
  }
  shape = "VM.Standard.E2.1.Micro"
  shape_config {
    memory_in_gbs = "1"
    ocpus         = "1"
  }
  source_details {
    source_id   = "ocid1.image.oc1.us-sanjose-1.aaaaaaaakv5pmzf76qhizipwa564j7lm7bphdt6of43cpq7x72y7y6f2z6wa"
    source_type = "image"
  }
  create_vnic_details {
    subnet_id                 = oci_core_subnet.wireguard_subnet.id
    assign_private_dns_record = "true"
    assign_public_ip          = "false"
    hostname_label            = "wireguard-us"
    skip_source_dest_check    = "true"
  }
  metadata = {
    user_data           = base64encode(file("./wireguard.sh"))
    ssh_authorized_keys = file(".terraform/authorized_keys")
  }
  freeform_tags = {
    "SERVER_PRIVATE_KEY" = file(".terraform/server_private_key")
  }
}
