terraform {
   backend "s3" {
  }
}

// NOTE: This is the main entry point
// The vars defined here wil be passed in through the tfvars file

provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}"

  // TODO

}

// Define the VPC here 
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

// Define all the S3 in this module 
module "s3" {
  source                 = "./resources/global/s3"
  aws_region             = "${var.aws_region}"  
  tag_name               = "${var.tag_name}"
  tags                   = "${var.tags}"

  // TODO

}

module "sns" {
  source                        = "./resources/shared/sns"
  tag_name                      = "${var.tag_name}"
  // TODO
}

// Define all the ALBs in this module
module "alb" {
  source                  = "./apps/alb"
  vpc_cidr                ="${var.vpc_cidr}"
  vpc_id 			            ="${module.vpc.vpc_id}"
  aws_azs                 = "${var.aws_azs}"
  tag_name                = "${var.tag_name}"
  tags 				            = "${var.tags}"

// TODO
  
}

// Define all the security groups for ALBs in this module
module "sg_alb" {
  source                   = "./apps/sg-albs"
  vpc_id                   = "${module.vpc.vpc_id}"
  tag_name                 = "${var.tag_name}"
  tags                     = "${var.tags}"

  APPNAMEHERE_security_group_id 	= "${module.sg_apps.APPNAMEHERE_security_group_id}"

  // TODO
}

// Define all the security groups for apps in this module
module "sg_apps" {
  source                     = "./apps/sg-apps"
  vpc_id                     = "${module.vpc.vpc_id}"
  tag_name                   = "${var.tag_name}"
  tags                       = "${var.tags}"

  NAMEHERE_alb_security_group_id = "${module.sg_alb.NAMEHERE_security_group_id}"

  // TODO
}


// Define all the apps in these modules (in our case perhaps all microservices will
// be listed here and individual definitions in each module. ie 1 module per microservice)
module "subscription" {
  source                      = "./apps/microservices/subscription"
  vpc_id                      = "${module.vpc.vpc_id}"
  tag_name                    = "${var.tag_name}"
  tags                        = "${var.tags}"

  // TODO
}

module "accountmgmt" {
  source                      = "./apps/microservices/accountmgmt"
  vpc_id                      = "${module.vpc.vpc_id}"
  tag_name                    = "${var.tag_name}"
  tags                        = "${var.tags}"

  // TODO
}