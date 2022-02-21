terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "programando-seu-emprego"

    workspaces {
      prefix = "terraform-s3-backend"
    }
  }
}
