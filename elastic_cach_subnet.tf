resource "aws_elasticache_subnet_group" "elastic_subnet" {
  name       = "tf-test-cache-subnet"
  subnet_ids = [module.network.public2_id]
}