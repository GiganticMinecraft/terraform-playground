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

resource "null_resource" "root_null_resource" {
  triggers = {
    always_run = "${timestamp()}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

module "child_module" {
  depends_on = [ null_resource.root_null_resource ]
  source  = "../child_module"
}
