output "api_gateway_invoke_url" {
  description = "The invoke URL for the API Gateway"
  value       = aws_apigatewayv2_api.http_api.api_endpoint
}
