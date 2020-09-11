terraform {
  backend "gcs" {
    bucket  = "tuba-fuchicorp"
    prefix  = "dev/hello-world"
    project = "brave-aviary-285822"
  }
}
