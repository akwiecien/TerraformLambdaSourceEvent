resource "aws_s3_bucket" "main-bucket" {
    bucket = "main-bucket-whatever7"
    acl = "private"
    force_destroy = true
    region = "eu-west-1"
}

resource "aws_s3_bucket" "backup-bucket" {
    bucket = "backup-bucket-whatever7"  
    acl = "private"
    force_destroy = true
    region = "eu-west-1"
}
