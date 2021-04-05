terraform {
    backend "s3" {
    bucket = "bucket3500"
    key    = "status/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "table1"
    }
}