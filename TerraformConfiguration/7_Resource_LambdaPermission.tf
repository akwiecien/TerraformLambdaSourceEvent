resource "aws_lambda_permission" "allow_cloud_watch_call_LambdaTerraformEventSource" {
  statement_id = "AllowExecutionFromS3Bucket"
  action = "lambda:invokeFunction"
  function_name = "${aws_lambda_function.LambdaTerraformEventSource.function_name}"
  source_arn = "${aws_s3_bucket.main-bucket.arn}"
  principal = "s3.amazonaws.com"
}
