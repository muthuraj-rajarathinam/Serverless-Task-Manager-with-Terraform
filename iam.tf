# 1️⃣ Create IAM Role for Lambda
resource "aws_iam_role" "lambda_exe_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# 2️⃣ Attach AWS basic execution policy (CloudWatch Logs)
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_exe_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# 3️⃣ Create custom policy for DynamoDB access
resource "aws_iam_policy" "lambda_dynamodb_policy" {
  name = "lambda-dynamodb-access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:DeleteItem",
          "dynamodb:Scan",
          "dynamodb:Query"
        ],
        Resource = aws_dynamodb_table.tasks_table.arn
      }
    ]
  })
}

# 4️⃣ Attach custom DynamoDB policy to Lambda role
resource "aws_iam_role_policy_attachment" "attach_lambda_dynamodb_policy" {
  role       = aws_iam_role.lambda_exe_role.name
  policy_arn = aws_iam_policy.lambda_dynamodb_policy.arn
}
