variable "deployment_image" {
  default = "tuyalou/hello-world-app:latest"
}

variable "deployment_environment" {
    default = "stage"
}
variable "deployment_name" {
    default = "hello-world"
}


variable "deployment_endpoint" {
  type = "map"

  default = {
    dev  = "dev.hello"
    qa   = "qa.hello"
    prod = "hello"
    stage = "stage.hello"
  }
}

variable "google_domain_name" {
    default = "tubaloughlin.com"
}

output "application_endpoint" {
  value = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
}
