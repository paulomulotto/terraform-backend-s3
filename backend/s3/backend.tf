terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "programando-seu-emprego"

    workspaces {
      name = "terraform-s3-backend"
    }
  }
}
