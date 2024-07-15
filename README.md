# terraform-aws-mcaf-ipam

Terraform module to manage AWS VPC IPAM.

## Usage

```
module "ipam" {
  source = "github.com/schubergphilis/terraform-aws-mcaf-ipam?ref=VERSION"

  aws_ipam_pool = ["10.64.0.0/12", "10.80.0.0/16"]

  pools = {
    sandbox = {
      cidr = ["10.64.0.0/16", "10.65.0.0/16"]
      shared_principal = ["arn:aws:organizations::123456789123:ou/o-a1a1a1a1a1/ou-1a1a-1a1a1a1a"]
    }
  }
}
```

**NOTE**: Review the documentation for the permissions needed to integrate with [AWS Organizations](https://docs.aws.amazon.com/vpc/latest/ipam/choose-single-user-or-orgs-ipam.html): The following Terraform resources need to be deployed prior to deploying this module in the AWS Organizations admin account:

```
resource "aws_ram_sharing_with_organization" "default" {}

resource "aws_vpc_ipam_organization_admin_account" "default" {
  delegated_admin_account_id = "123456789123"
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## Licensing

100% Open Source and licensed under the Apache License Version 2.0. See [LICENSE](https://github.com/schubergphilis/terraform-aws-mcaf-ipam/blob/main/LICENSE) for full details.
