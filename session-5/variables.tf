variable "region" {
  type        = string
  description = "AWS Region"
  default     = "us-west-2"
}
variable "env" {
  type        = string
  description = "Environment"
  default     = "dev"
}
variable "tier" {
  type        = string
  description = "Application Tier"
  default     = "backend"
}
variable "project" {
  type        = string
  description = "Project Name"
  default     = "jerry"
}
variable "team" {
  type        = string
  description = "Team Name"
  default     = "cloud"
}
variable "owner" {
  type        = string
  description = "Owner of the resource"
  default     = "Kris"
}
variable "managed_by" {
  type        = string
  description = "managed by"
  default     = "terraform"
}
