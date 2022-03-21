variable "vpc_name" {
  default = "tf_vpc_name"
  type = string
  description = "The name of VPC."
}

variable "vpc_cidr_block" {
  default = "11.0.0.0/16"
  type = string
  description = "The CIDR block of VPC."
}

variable "vswitch_name_1" {
  default = "tf_vswitch_name_1"
  type = string
  description = "The name of one v_switch."
}

variable "vswitch_name_2" {
  default = "tf_vswitch_name_2"
  type = string
  description = "The name of the other v_switch."
}

variable "alb_address_type" {
  default = "Internet"
  type = string
  description = "The address type of ALB."
}

variable "alb_address_allocated_mode" {
  default = "Fixed"
  type = string
  description = "The address allocated mode of ALB."
}

variable "alb_load_balancer_name" {
  default = "tf_alb_name"
  type = string
  description = "The name of ALB."
}

variable "alb_load_balancer_edition" {
  default = "Basic"
  type = string
  description = "The edition of ALB."
}

