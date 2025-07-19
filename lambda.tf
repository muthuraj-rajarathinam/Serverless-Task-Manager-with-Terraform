data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambdas/task_manager.py"
  output_path = "${path.module}/lambdas/task_manager.zip"
}

resource "aws_lambda_function" "task_manager_lambda" {
  function_name = "task_manager_lambda"
  description   = "Lambda function to manage tasks"
  role          = aws_iam_role.lambda_exe_role.arn
  handler       = "task_manager.lambda_handler"
  runtime       = "python3.8"
  filename      = "${path.module}/lambdas/task_manager.zip"  # <-- fixed here

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.tasks_table.name   
    }
  }
}
