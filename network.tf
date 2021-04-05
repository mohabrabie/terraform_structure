module "network" {
  source = "./network"
    public1_cider  = var.public1_cider
    public2_cider  = var.public2_cider
    private1_cider = var.private1_cider
    private2_cider = var.private2_cider
    subnet_public1_AZ  = var.subnet_public1_AZ
    subnet_public2_AZ  = var.subnet_public2_AZ
    subnet_private1_AZ = var.subnet_private1_AZ
    subnet_private2_AZ = var.subnet_private2_AZ
    vpc_cider          = var.vpc_cider
}
