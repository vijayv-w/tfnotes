terraform {
   backend "s3" {
  }
}

provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"

  // TODO

}

module "vpc" {
  source       		      = "vpc"
  vpc_cidr              = "${var.vpc_cidr}"
  aws_azs               = "${var.aws_azs}"
  environment   	      = "${var.environment}"
  tag_name   	          = "${var.tag_name}"
  costcenter   	        = "${var.costcenter}"
  hostingprovider   	  = "${var.hostingprovider}"

// TODO

}

module "s3" {
  source                        = "./resources/global/s3"
  aws_region                    = "${var.aws_region}"
  
  // TODO
  
  tag_name                      = "${var.tag_name}"
  
  tags                          = "${var.tags}"
}

module "sg_alb" {
  source                        = "./apps/sg-albs"
  vpc_id                        = "${module.vpc.vpc_id}"
  // TODO
  tag_name                      = "${var.tag_name}"
  tags                          = "${var.tags}"
}

module "sg_apps" {
  source                        = "./apps/sg-apps"
  vpc_id                        = "${module.vpc.vpc_id}"
  
  // TODO
  tag_name                      = "${var.tag_name}"
  tags                          = "${var.tags}"
}

module "srvc1" {
  source                        = "./apps/srvc1"
  vpc_id                        = "${module.vpc.vpc_id}"
  
  // TODO

  tag_name                      = "${var.tag_name}"
  tags                          = "${var.tags}"
}

module "srvc2" {
  source                        = "./apps/srvc2"
  vpc_id                        = "${module.vpc.vpc_id}"

  // TODO

  tag_name                      = "${var.tag_name}"
  tags                          = "${var.tags}"
}
