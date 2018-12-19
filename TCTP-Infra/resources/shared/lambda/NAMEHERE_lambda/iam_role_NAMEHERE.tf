resource "aws_iam_role" "NAMEHERE_lambda_role" {
  //TODO
}

resource "aws_iam_role_policy_attachment" "awsLambdaVPCAccessExecutionRole_policy_attach" {
  role = "${aws_iam_role.NAMEHERE_lambda_role.name}"
  policy_arn = "${data.aws_iam_policy.awsLambdaVPCAccessExecutionRole_policy.arn}"
}

resource "aws_iam_role_policy_attachment" "NAMEHERE_lambda_policy_attach" {
  role = "${aws_iam_role.NAMEHERE_lambda_role.name}"
  policy_arn = "${aws_iam_policy.NAMEHERE_lambda_policy.arn}"
}