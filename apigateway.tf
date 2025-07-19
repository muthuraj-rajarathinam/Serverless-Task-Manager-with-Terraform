resource "aws_apigatewayv2_api" "http_api" {
  name          = "task_manager_api"
  protocol_type = "HTTP"
  description   = "API Gateway for Task Manager Lambda Function"

  cors_configuration {
    allow_methods = ["GET", "POST", "PUT", "DELETE"]
    allow_origins = ["*"]
  }
  
}
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id             = aws_apigatewayv2_api.http_api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.task_manager_lambda.invoke_arn
  integration_method = "POST"

  timeout_milliseconds = 29000
  
}
resource "aws_apigatewayv2_route" "default_route" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "ANY /{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
  
}
resource "aws_apigatewayv2_stage" "default_stage" {
  api_id = aws_apigatewayv2_api.http_api.id
  name   = "$default"
  
  auto_deploy = true
}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.task_manager_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.http_api.execution_arn}/*/*"
  
}