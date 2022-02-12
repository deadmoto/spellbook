variable tenancy_ocid { default = "ocid1.tenancy.oc1..aaaaaaaauf7mfoaww3jv34m57dcbjo6jxjn737gn3nwzfi6vbfeuwsvajnkq" }
variable user_ocid { default = "ocid1.user.oc1..aaaaaaaarl2fnjl4wcxqgprfbvhru2bo6r2icgaazgb54wm7mkckdlp43xtq" }
variable fingerprint { default = "b9:48:2d:94:0d:97:6c:e6:7c:76:42:54:77:1b:ff:82" }
variable private_key_path { default = ".terraform/oci_private_key.pem" }
variable region { default = "us-sanjose-1" }

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}