provider "aws" {
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  region                      = "us-east-1"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2            = "http://ec2.localhost.localstack.cloud:4566"
    apigateway     = "https//apigateway.localhost.localstack.cloud:4566"
    cloudformation = "http://cloudformation.localhost.localstack.cloud:4566"
    cloudwatch     = "http://cloudwatch.localhost.localstack.cloud:4566"
    dynamodb       = "http://dynamodb.localhost.localstack.cloud:4566"
    es             = "http://es.localhost.localstack.cloud:4566"
    elasticache    = "http://elasticache.localhost.localstack.cloud:4566"
    firehose       = "http://firehose.localhost.localstack.cloud:4566"
    iam            = "http://iam.localhost.localstack.cloud:4566"
    kinesis        = "http://kinesis.localhost.localstack.cloud:4566"
    lambda         = "http://lambda.localhost.localstack.cloud:4566"
    rds            = "http://rds.localhost.localstack.cloud:4566"
    redshift       = "http://redshift.localhost.localstack.cloud:4566"
    route53        = "http://route53.localhost.localstack.cloud:4566"
    s3             = "http://s3.localhost.localstack.cloud:4566"
    secretsmanager = "http://secretsmanager.localhost.localstack.cloud:4566"
    ses            = "http://ses.localhost.localstack.cloud:4566"
    sns            = "http://sns.localhost.localstack.cloud:4566"
    sqs            = "http://sqs.localhost.localstack.cloud:4566"
    ssm            = "http://ssm.localhost.localstack.cloud:4566"
    stepfunctions  = "http://stepfunctions.localhost.localstack.cloud:4566"
    sts            = "http://sts.localhost.localstack.cloud:4566"
  }
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-bucket"
}

resource "aws_s3_bucket_acl" "test-bucket-acl" {
  bucket = aws_s3_bucket.test-bucket.id
  acl    = "private"
}

resource "aws_api_gateway_authorizer" "demo" {
  name                   = "demo"
  rest_api_id            = "${aws_api_gateway_rest_api.demo.id}"
  authorizer_uri         = "${aws_lambda_function.authorizer.invoke_arn}"
  authorizer_credentials = "${aws_iam_role.invocation_role.arn}"
  type = "TOKEN"
}

resource "aws_api_gateway_rest_api" "demo" {
  name = "auth-demo"
}

resource "aws_iam_role" "invocation_role" {
  name = "api_gateway_auth_invocation"
  path = "/"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:ListBucket",
    "Resource": "arn:aws:s3:::test-bucket"
  }
}
EOF
}

resource "aws_iam_role_policy" "invocation_policy" {
  name = "default"
  role = "${aws_iam_role.invocation_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:ListBucket",
    "Resource": "arn:aws:s3:::example_bucket"
  }
}
EOF
}

resource "aws_iam_role" "lambda" {
  name = "demo-lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "s3:ListBucket",
    "Resource": "arn:aws:s3:::example_bucket"
  }
}
EOF
}

resource "aws_lambda_function" "authorizer" {
  filename      = "lambda.zip"
  function_name = "api_gateway_authorizer"
  role          = "${aws_iam_role.lambda.arn}"
  handler       = "lambda.hello"
  runtime       = "python3.7"
  source_code_hash = "${filebase64sha256("lambda.zip")}"
}

#resource "aws_elasticsearch_domain" "example" {
#  domain_name           = "test-domain"
#  elasticsearch_version = "1.5"

#    cluster_config {
#    instance_type = "r4.large.elasticsearch"
#  }

#  snapshot_options {
#    automated_snapshot_start_hour = 23
#  }

#  tags = {
#    Domain = "TestDomain"
#  }
#}

resource "aws_elasticache_cluster" "my-redis" {
  cluster_id           = "my-redis-cluster"
  engine               = "redis"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
}

resource "aws_db_parameter_group" "default" {
  name   = "rds-pg"
  family = "mysql5.6"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }
}

/*
# TODO enable once fixed
resource "aws_security_group" "eks-node" {
  name        = "some-sg-1"
  vpc_id      = "vpc123"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
*/
