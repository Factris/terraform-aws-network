data "template_file" "user-data" {

  template = "${file(${path.module}/var.userdata_path)}"

  vars {
    authorized_keys   =  "  - ${join("\n  - ", split("\n", trimspace(file(var.authorized_keys))))}"
  }
}