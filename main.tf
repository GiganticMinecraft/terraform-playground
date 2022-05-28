terraform {
  cloud {
    organization = "GiganticMinecraft"

    workspaces {
      name = "terraform-playground"
    }
  }
}

provider "null" {
  alias = "null_1"
}

resource "null_resource" "null_1_resource" {
  provider = null.null_1
  
  triggers = {
    always_run = "${timestamp()}"
  }
}

provider "null" {
  alias = "null_2"

  random_field = null_resource.null_1_resource.id
}

resource "null_resource" "null_2_resource" {
  provider = null.null_2
}
