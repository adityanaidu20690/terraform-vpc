module "vpc" {

  source      = "./modules/vpc"
  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
}

module "ec2" {
  source    = "./modules/ec2"
  subnet_id = module.vpc.subnet_id
  sg_id     = module.sg.sg_id
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}