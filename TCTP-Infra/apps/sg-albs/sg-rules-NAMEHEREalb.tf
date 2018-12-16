// Define Ingress rules
resource "aws_security_group_rule" "NAMEHERE_alb_sg_rule_ig_0" {
  // NOTE: For Example ONLY. To explain how the variables and 
  // interpolation syntax are used in Terraform
  security_group_id         = "${aws_security_group.NAMEHERE_alb_security_group.id}"
  type                      = "ingress"
  from_port                 = 443
  to_port                   = 443
  protocol                  = "tcp"
  source_security_group_id  = "${var.APPNAMEHERE_security_group_id}"

}

// Define Egress rules
resource "aws_security_group_rule" "NAMEHERE_alb_sg_rule_eg_0" {
  // NOTE: For Example ONLY. To explain how the variables and 
  // interpolation syntax are used in Terraform
  security_group_id         = "${aws_security_group.NAMEHERE_alb_security_group.id}"
  type                      = "egress"
  from_port                 = 0
  to_port                   = 0
  protocol                  = -1
  cidr_blocks     	        = ["0.0.0.0/0"]
}
