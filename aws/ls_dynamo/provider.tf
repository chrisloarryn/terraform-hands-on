provider "aws" {
  access_key = "mock_access_key"
  secret_key = "mock_secret_key"
  region     = "us-east-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2             = "http://ec2.localhost.localstack.cloud:4566"
    s3              = "http://s3.localhost.localstack.cloud:4566"
    sts             = "http://sts.localhost.localstack.cloud:4566"
    route53         = "http://route53.localhost.localstack.cloud:4566"
    s3control       = "http://s3-control.localhost.localstack.cloud:4566"
    route53resolver = "http://route53resolver.localhost.localstack.cloud:4566"
    dynamodb        = "http://dynamodb.localhost.localstack.cloud:4566"
  }

  default_tags {
    tags = {
      Environment = "local"
      Service     = "LocalStack"
    }
  }
}

terraform {
  required_version = ">= 1.2.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.60.0, < 4.22.0"
    }
  }
}