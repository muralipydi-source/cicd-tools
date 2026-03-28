variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "zone_name" {
  type        = string
  default     = "muraliitemp.online"
  description = "description"
}

variable "zone_id" {
  type        = string
  default     = "Z02046772T5LD5LI0QG6T"   ## Z02046772T5LD5LI0QG6T Z01602722QJVZMCD67LWU####
  description = "description"
}

variable "ami_id" {
  default = "ami-0220d79f3f480ecf5"

}