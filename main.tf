module "vpc" {
  source    = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  vpc_name   = "my-vpc"
}

module "subnet" {
  source                = "./modules/subnet"
  vpc_id                = module.vpc.vpc_id
  public_cidr_block     = "10.0.1.0/24"
  private_cidr_block    = "10.0.2.0/24"
  availability_zone     = "us-east-1a"
  public_subnet_name    = "public-subnet"
  private_subnet_name   = "private-subnet"
}

module "nat-gateway" {
  source             = "./modules/nat-gateway"
  public_subnet_id  = module.subnet.public_subnet_id
}

module "route-table" {
  source                  = "./modules/route-table"
  vpc_id                  = module.vpc.vpc_id
  internet_gateway_id     = module.vpc.internet_gateway_id
  nat_gateway_id          = module.nat-gateway.nat_gateway_id
  public_subnet_id        = module.subnet.public_subnet_id
  private_subnet_id       = module.subnet.private_subnet_id
  public_subnet_name      = "public-subnet"
  private_subnet_name     = "private-subnet"
}
