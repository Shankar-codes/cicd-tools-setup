variable "project" {
  default     = "ellamma-ecommerce"
}

variable "environment" {
  default     = "dev"
}

variable "zone_id" {
    type        = string
    description = "The ID of the Route53 Hosted Zone"
    default     = "Z1PA6795UKMFR9"
}