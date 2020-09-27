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

resource "null_resource" "appversion" {
  provisioner "local-exec" {
    command = <<EOF
    sed -i "s/^appVersion:.*$/appVersion: $(git describe)/" chart/*/Chart.yaml  
    EOF
  }
}
