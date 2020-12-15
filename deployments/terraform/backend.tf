terraform {
  backend "gcs" {
    bucket  = "bucket-loughlin"
    prefix  = "dev/hello-world"
    project = "macro-storm-297919"
  }
}
