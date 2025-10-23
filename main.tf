resource "alicloud_alb_load_balancer" "alb" {
  count                       = var.create ? 1 : 0
  vpc_id                      = var.vpc_id
  address_type                = var.address_type
  address_allocated_mode      = var.address_allocated_mode
  load_balancer_name          = var.load_balancer_name
  load_balancer_edition       = var.load_balancer_edition
  tags                        = var.tags
  resource_group_id           = var.resource_group_id
  deletion_protection_enabled = var.deletion_protection_enabled
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

resource "alicloud_alb_server_group" "alb_server_group" {
  count             = var.create_server_group ? 1 : 0
  protocol          = var.health_check_protocol
  vpc_id            = var.vpc_id
  server_group_name = var.alb_group_name
  health_check_config {
    health_check_connect_port = var.health_check_connect_port
    health_check_enabled      = var.health_check_enabled
    health_check_host         = var.health_check_host
    health_check_codes        = var.health_check_codes
    health_check_http_version = var.health_check_http_version
    health_check_interval     = var.health_check_interval
    health_check_method       = var.health_check_method
    health_check_path         = var.health_check_path
    health_check_protocol     = var.health_check_protocol
    health_check_timeout      = var.health_check_timeout
    healthy_threshold         = var.healthy_threshold
    unhealthy_threshold       = var.unhealthy_threshold
  }
  sticky_session_config {
    sticky_session_enabled = true
    cookie                 = "tf-testAcc"
    sticky_session_type    = "Server"
  }
  tags = {
    Created = "TF"
  }
  dynamic "servers" {
    for_each = var.ecs_servers
    content {
      server_id   = servers.value["id"]
      port        = var.health_check_connect_port
      server_ip   = servers.value["server_ip"]
      description = servers.value["name"]
      server_type = "Ecs"
      weight      = servers.value["weight"]
    }
  }
}