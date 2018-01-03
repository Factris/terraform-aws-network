data "template_file" "user-data" {

  template = "${file(var.userdata_path)}"

  vars {
    authorized_keys   =  "  - ${join("\n  - ", split("\n", trimspace(file(var.authorized_keys))))}"
  }
}