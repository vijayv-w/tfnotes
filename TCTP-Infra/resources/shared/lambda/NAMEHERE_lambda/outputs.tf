output "NAMEHERE_lambda_iam_policy_arn" {
  value = "${aws_iam_policy.NAMEHERE_lambda_policy.arn}"
}
output "NAMEHERE_lambda_iam_role_arn" {
  value = "${aws_iam_role.NAMEHERE_lambda_role.arn}"
}

output "NAMEHERE_lambda_arn" {
  value = "${aws_lambda_function.NAMEHERE_lambda.arn}"
}

output "NAMEHERE_lambda_version" {
  value = "${aws_lambda_function.NAMEHERE_lambda.version}"
}
