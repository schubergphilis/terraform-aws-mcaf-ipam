provider "aws" {
  region = "eu-west-1"
}

module "aurora" {
  source = "../.."

  aws_ipam_pool = ["10.64.0.0/12", "10.80.0.0/16"]

  pools = {
    sandbox = {
      cidr             = ["10.64.0.0/16", "10.65.0.0/16"]
      shared_principal = ["arn:aws:organizations::123456789123:ou/o-a1a1a1a1a1/ou-1a1a-1a1a1a1a"]
    }
  }
}
