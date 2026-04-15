variable "web_port" {
  description = "Puertos para la web segun el entorno"
  type        = map(number)
  default     = {
    "default" = 8080
    "dev"     = 8081
    "prod"    = 8082
  }
}

variable "api_port" {
  description = "Puertos para la api segun el entorno"
  type        = map(number)
  default     = {
    "default" = 3000
    "dev"     = 3001
    "prod"    = 3002
  }
}
