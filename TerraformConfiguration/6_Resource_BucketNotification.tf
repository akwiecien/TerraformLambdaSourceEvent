resource "aws_s3_bucket_notification" "bucket_terraform_notification" {
  bucket = "${aws_s3_bucket.main-bucket.id}"
  lambda_function {
    lambda_function_arn = "${aws_lambda_function.LambdaTerraformEventSource.arn}"
    events = ["s3:ObjectCreated:*"]
  }
}