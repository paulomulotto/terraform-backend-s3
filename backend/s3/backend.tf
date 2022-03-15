terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "programando-seu-emprego-2"

    workspaces {
      prefix = "terraform-s3-backendbackend-aws-pse"
    }
  }
}
