variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "ap-south-1"  # or your desired region
}


variable "lambda_function_name" {
    description = "Name of the Lambda function"
    type        = string
    default     = "serverless_saas_lambda"
}