resource "alicloud_alb_load_balancer" "alb" {
  count                  = var.create ? 1 : 0
  vpc_id                 = var.vpc_id
  address_type           = var.address_type
  address_allocated_mode = var.address_allocated_mode
  load_balancer_name     = var.load_balancer_name
  load_balancer_edition  = var.load_balancer_edition
  tags                   = var.tags
  load_balancer_billing_config {
    pay_type = "PayAsYouGo"
  }
  dynamic "zone_mappings" {
    for_each = var.zone_mappings
    content {
      vswitch_id = zone_mappings.value["vswitch_id"]
      zone_id    = zone_mappings.value["zone_id"]
    }
  }
  modification_protection_config {
    status = var.modification_protection_config_status
    reason = var.modification_protection_config_reason
  }

  dynamic "access_log_config" {
    for_each = var.access_log_config
    content {
      log_project = access_log_config.value["log_project"]
      log_store   = access_log_config.value["log_store"]
    }
  }
}