data "alicloud_alb_zones" "default" {}

resource "alicloud_vpc" "default" {
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr_block
}

resource "alicloud_vswitch" "vswitch_1" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = cidrsubnet(alicloud_vpc.default.cidr_block, 8, 2)
  zone_id      = data.alicloud_alb_zones.default.zones.0.id
  vswitch_name = var.vswitch_name_1
}

resource "alicloud_vswitch" "vswitch_2" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = cidrsubnet(alicloud_vpc.default.cidr_block, 8, 4)
  zone_id      = data.alicloud_alb_zones.default.zones.1.id
  vswitch_name = var.vswitch_name_2
}

module "example" {
  create                 = true
  source                 = "../.."
  vpc_id                 = alicloud_vpc.default.id
  address_type           = "Internet"
  address_allocated_mode = "Fixed"
  load_balancer_name     = "tf_alb_name"
  load_balancer_edition  = "Basic"
  zone_mappings = [
    { vswitch_id = alicloud_vswitch.vswitch_1.id, zone_id = data.alicloud_alb_zones.default.zones.0.id },
    { vswitch_id = alicloud_vswitch.vswitch_2.id, zone_id = data.alicloud_alb_zones.default.zones.1.id }
  ]
}