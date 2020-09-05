terraform {
  backend "gcs" {
    bucket  = "tuba-fuchicorp"
    prefix  = "tools/hello-app"
    project = "brave-aviary-285822"
  }
}
