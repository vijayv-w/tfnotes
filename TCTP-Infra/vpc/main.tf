/* VPC */

resource "aws_vpc" "NAMEHERE_vpc" {
  // TODO

}

/* igw */

resource "aws_internet_gateway" "NAMEHERE_igw" {
  // TODO

}

/* NAT Gateway in Availability Zone A*/
resource "aws_nat_gateway" "NAMEHERE_natgw_a" {
  // TODO

}

/* Elastic IP for NAT Gateway in Availability Zone A. */
resource "aws_eip" "NAMEHERE_eip_a" {
  // TODO

}

/* NAT Gateway in Availability Zone B*/
resource "aws_nat_gateway" "NAMEHERE_natgw_b" {
  // TODO

}

/* Elastic IP for NAT Gateway in Availability Zone B. */
resource "aws_eip" "NAMEHERE_eip_b" {
  // TODO

}
