variable "deployment_image" {
  default = "docker.tubaloughlin.com/tubes-hello-app-dev-feature:df74885"
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
