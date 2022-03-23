output "this_alb_instance_id" {
  description = "The instance ID of ALB."
  value       = concat(alicloud_alb_load_balancer.alb.*.id, [""])[0]
}