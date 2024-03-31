data "aws_region" "current" {}

variable "environment_name" {
  description = "A friendly name for the environment that will be used for namespacing resources. Example: dev, stage, prod"
  type        = string
  default     = "ecsapi-demo"
}

variable "private_dns_namespace_name" {
  description = "The name of the private DNS namespace to create"
  type        = string
  default     = "example.com"
}

variable "min_containers_foodstore_foods" {
  description = "The minimum number of containers to run for the foodstore service"
  type        = number
  default     = 3
}

variable "max_containers_foodstore_foods" {
  description = "The maximum number of containers to run for the foodstore service"
  type        = number
  default     = 30
}

variable "auto_scaling_target_value_petstore_pets" {
  description = "Target CPU utilization (%) for ECS service autoscaling"
  type        = number
  default     = 50
}

resource "aws_dynamodb_table" "dynamo_db_table_foodstore_foods" {
  name         = "foodstore_foods_second"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "food_id"
  attribute {
    name = "food_id"
    type = "S"
  }
  tags = {
    Environment = var.environment_name
    Service     = "LocalStack"
    Owner       = "Chris Loarryn"
    Store       = "Foodstore"
  }
}

resource "aws_dynamodb_table" "dynamo_db_table_petstore_pets" {
  name         = "petstore_pets_second"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "pet_id"
  attribute {
    name = "pet_id"
    type = "S"
  }
  tags = {
    Environment = var.environment_name
    Service     = "LocalStack"
    Owner       = "Chris Loarryn"
    Store       = "Petstore"
  }
}

resource "aws_vpc" "vpc" {
  enable_dns_support   = true
  enable_dns_hostnames = true
  cidr_block           = "10.0.0.0/16"
}

data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_subnet" "public_subnet_one" {
  availability_zone       = element(data.aws_availability_zones.available.names, 0)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_two" {
  availability_zone       = element(data.aws_availability_zones.available.names, 1)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
}