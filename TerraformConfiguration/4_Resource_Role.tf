resource "aws_iam_role" "LambdaEventSourceRole" {
  name = "LambdaEventSourceRole"
  description = "Role for lambda"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
}
  EOF
  tags = {
    tag-key = "tag-vale"
  }
}

resource "aws_iam_role_policy_attachment" "AWSLambdaBasicExecutionRole-attach" {
  role       = "${aws_iam_role.LambdaEventSourceRole.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "AmazonS3Access-attach" {
  role       = "${aws_iam_role.LambdaEventSourceRole.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

