provider "aws" {
  access_key = "mock_access_key"
  secret_key = "mock_secret_key"
  region     = "us-east-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2              = "http://ec2.localhost.localstack.cloud:4566"
    s3               = "http://s3.localhost.localstack.cloud:4566"
    sts              = "http://sts.localhost.localstack.cloud:4566"
    route53          = "http://route53.localhost.localstack.cloud:4566"
    s3control        = "http://s3-control.localhost.localstack.cloud:4566"
    route53resolver  = "http://route53resolver.localhost.localstack.cloud:4566"
    dynamodb         = "http://dynamodb.localhost.localstack.cloud:4566"
    config           = "http://config.localhost.localstack.cloud:4566"
    cloudwatch       = "http://cloudwatch.localhost.localstack.cloud:4566"
    cloudwatchlogs   = "http://cloudwatchlogs.localhost.localstack.cloud:4566"
    cloudwatchevents = "http://events.localhost.localstack.cloud:4566"
    lambda           = "http://lambda.localhost.localstack.cloud:4566"
    apigateway       = "http://apigateway.localhost.localstack.cloud:4566"
    kinesis          = "http://kinesis.localhost.localstack.cloud:4566"
    firehose         = "http://firehose.localhost.localstack.cloud:4566"
    stepfunctions    = "http://stepfunctions.localhost.localstack.cloud:4566"
    secretsmanager   = "http://secretsmanager.localhost.localstack.cloud:4566"
    ssm              = "http://ssm.localhost.localstack.cloud:4566"
    kms              = "http://kms.localhost.localstack.cloud:4566"
    cloudformation   = "http://cloudformation.localhost.localstack.cloud:4566"
    es               = "http://es.localhost.localstack.cloud:4566"
    rds              = "http://rds.localhost.localstack.cloud:4566"
    redshift         = "http://redshift.localhost.localstack.cloud:4566"
    sns              = "http://sns.localhost.localstack.cloud:4566"
    sqs              = "http://sqs.localhost.localstack.cloud:4566"
    swf              = "http://swf.localhost.localstack.cloud:4566"
    ses              = "http://ses.localhost.localstack.cloud:4566"
    elasticsearch    = "http://elasticsearch.localhost.localstack.cloud:4566"
    autoscaling      = "http://autoscaling.localhost.localstack.cloud:4566"
    cloudfront       = "http://cloudfront.localhost.localstack.cloud:4566"
    organizations    = "http://organizations.localhost.localstack.cloud:4566"
    iam              = "http://iam.localhost.localstack.cloud:4566"
    cloudtrail       = "http://cloudtrail.localhost.localstack.cloud:4566"
    codepipeline     = "http://codepipeline.localhost.localstack.cloud:4566"
    codebuild        = "http://codebuild.localhost.localstack.cloud:4566"
    codecommit       = "http://codecommit.localhost.localstack.cloud:4566"
    codeartifact     = "http://codeartifact.localhost.localstack.cloud:4566"
    ecr              = "http://ecr.localhost.localstack.cloud:4566"
    eks              = "http://eks.localhost.localstack.cloud:4566"
    efs              = "http://efs.localhost.localstack.cloud:4566"
    fsx              = "http://fsx.localhost.localstack.cloud:4566"
    sagemaker        = "http://sagemaker.localhost.localstack.cloud:4566"
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