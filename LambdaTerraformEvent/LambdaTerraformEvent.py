import json
import boto3
import smtplib
import ssl


def lambda_handler(event, context):
    

    s3 = boto3.resource('s3')
    backUpBucket = s3.Bucket("backup-bucket-whatever7")
    

    for record in event['Records']:
        s3bucket = record['s3']['bucket']['name']
        s3objectKey = record['s3']['object']['key']

        copy_source = {
            'Bucket': s3bucket,
            'Key': s3objectKey
        }

        backUpBucket.copy(copy_source, s3objectKey)

    return {
        "statusCode": 200,
        "body": json.dumps({
            "resource": "Lambda function",
            "trigger": "Source Event"
        }),
    }
