variable "lb_container_port" {
  description = "The container port to be exposed by the load balancer."
  type        = number
  default     = 5637 
}

variable "ecs_task_def_memory" {
  description = "Memory"
  type        = number
  default     = 512 
}

variable "ecs_task_def_cpu" {
  description = "CPU"
  type        = number
  default     = 256 
}