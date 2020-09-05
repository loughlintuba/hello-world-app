module "hello-world-deploy" {
  source  = "fuchicorp/chart/helm"
  deployment_name        = "hello-world"
  deployment_environment = "${var.deployment_environment}"
  deployment_endpoint    = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
  deployment_path        = "hello-world"
  template_custom_vars  = {     
    deployment_image    = "${var.deployment_image}"
  }
}

variable "deployment_image" {
  default = "docker.tubaloughlin.com/tubes-hello-app-dev-feature:df74885"
}
variable "deployment_environment" {
    default = "stage"
}

variable "deployment_endpoint" {
  type = "map"

  default = {
    test  = "test.hello-world"
    dev  = "dev.hello-world"
    qa   = "qa.hello-world"
    prod = "hello-world"
    stage = "stage.hello-world"
  }
}

variable "google_domain_name" {
    default = "tubaloughlin.com"
}

output "application_endpoint" {
  value = "${lookup(var.deployment_endpoint, "${var.deployment_environment}")}.${var.google_domain_name}"
}