resource "aws_lambda_function" "LambdaTerraformEventSource" {
  filename = "DeployPackage.zip"
  function_name = "LambdaTerraformEventSource"
  handler = "LambdaTerraformEvent.lambda_handler"
  runtime = "python3.7"
  timeout = "60"
  role = "${aws_iam_role.LambdaEventSourceRole.arn}"
}