###########################
# ALB Load Balancer
###########################
variable "create" {
  description = "Whether to create load balancer in module."
  type        = bool
  default     = false
}

variable "vpc_id" {
  type        = string
  description = "The vpc that the ALB belong to."
}

variable "zone_mappings" {
  type = list(object({
    vswitch_id = string
    zone_id    = string
  }))
  description = "zone mappings which bind to alb group."
  default     = []
}

variable "address_type" {
  default     = "Internet"
  type        = string
  description = "The address type of ALB."
}

variable "address_allocated_mode" {
  default     = "Fixed"
  type        = string
  description = "The address allocated mode of ALB."
}

variable "load_balancer_name" {
  default     = null
  type        = string
  description = "The name of ALB."
}

variable "load_balancer_edition" {
  default     = "Basic"
  type        = string
  description = "The edition of ALB."
}

variable "deletion_protection_enabled" {
  default     = false
  type        = bool
  description = "The deletion protection enabled."
}

variable "access_log_config" {
  type = list(object({
    log_project = string
    log_store   = string
  }))
  description = "The Access Logging Configuration Structure."
  default     = []
}

variable "resource_group_id" {
  description = "The ID of the resource group."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "modification_protection_config_status" {
  description = "Specifies whether to enable the configuration read-only mode for the ALB instance."
  type        = string
  default     = "NonProtection"
}
variable "modification_protection_config_reason" {
  description = "The reason for modification protection."
  type        = string
  default     = null
}

###########################
# ALB Server Group
###########################

variable "create_server_group" {
  description = "Whether to create server group in module."
  type        = bool
  default     = false
}

variable "alb_group_name" {
  default     = null
  type        = string
  description = "The name of ALB group."
}

variable "ecs_servers" {
  type = list(object({
    id        = string
    name      = string
    weight    = number
    server_ip = string
  }))
  description = "Ecs servers which bind to alb group."
  default     = []
}

variable "health_check_connect_port" {
  description = "The port of health check."
  type        = number
  default     = null
}

variable "health_check_enabled" {
  description = "Whether enable health check."
  type        = bool
  default     = true
}

variable "health_check_host" {
  description = "The host of health check"
  type        = string
  default     = null
}

variable "health_check_codes" {
  description = "The codes of health check."
  type        = list(string)
  default     = []
}

variable "health_check_http_version" {
  description = "The version of http protocol."
  type        = string
  default     = "HTTP1.1"
}

variable "health_check_interval" {
  description = "The interval of health check"
  type        = number
  default     = null
}

variable "health_check_method" {
  description = "The http method of health check."
  type        = string
  default     = "HEAD"
}

variable "health_check_path" {
  description = "The http path of health check."
  type        = string
  default     = null
}

variable "health_check_protocol" {
  description = "The http protocol of health check."
  type        = string
  default     = "HTTP"
}

variable "health_check_timeout" {
  description = "The timeout of health check"
  type        = number
  default     = null
}

variable "healthy_threshold" {
  description = "The good threshold of health check"
  type        = number
  default     = null
}

variable "unhealthy_threshold" {
  description = "The bad threshold of health check"
  type        = number
  default     = null
}

