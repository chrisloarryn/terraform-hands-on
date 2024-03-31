data "aws_region" "current" {}

resource "aws_dynamodb_table" "dynamo_db_table_foodstore_foods" {
  name           = "foodstore_foods"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "food_id"
  attribute {
    name = "food_id"
    type = "S"
  }
  tags = {
    Environment = "local"
    Service     = "LocalStack"
    Owner       = "Chris Loarryn"
  }
}