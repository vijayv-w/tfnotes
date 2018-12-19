resource "aws_iam_policy" "NAMEHERE_lambda_policy" {
// TODO
}

data "aws_iam_policy" "awsLambdaVPCAccessExecutionRole_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}