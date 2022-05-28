provider "null" {
  alias = "null_2"
}

resource "null_resource" "child_null_resource" {
  provider = null.null_2
}
