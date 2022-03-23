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

variable "log_project" {
  description = "The log service that access logs are shipped to."
  type        = string
  default     = null
}

variable "log_store" {
  description = "The log service that access logs are shipped to."
  type        = string
  default     = null
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

variable "create" {
  description = "Whether to create resources in module."
  type        = bool
  default     = false
}
