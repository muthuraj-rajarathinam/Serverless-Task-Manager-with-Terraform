resource "aws_dynamodb_table" "tasks_table" {
  name         = "tasks_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "task_id"

  attribute {
    name = "task_id"
    type = "S"
  }

  tags = {
    Name        = "TasksTable"
    Environment = "Production"
  }
}