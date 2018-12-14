resource "aws_security_group" "APPNAMEHERE_security_group" {
  name        = "${lower(var.tag_name)}-APPNAMEHERE-instance-sg"

  // TODO

  tags        = "${merge(var.tags, map("Name", format("%s-%s", lower(var.tag_name), "APPNAMEHERE-instance-sg")))}"
}

