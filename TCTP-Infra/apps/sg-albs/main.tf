resource "aws_security_group" "NAMEHERE_alb_security_group" {
  name        = "${lower(var.tag_name)}-NAMEHERE-sg"
 
  // TODO
 
  tags        = "${merge(var.tags, map("Name", format("%s-%s", lower(var.tag_name), "NAMEHERE-sg")))}"
}

