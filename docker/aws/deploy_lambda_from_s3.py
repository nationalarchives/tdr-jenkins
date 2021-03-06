import sys
from sessions import get_session
import boto3

account_number = sys.argv[1]
stage = sys.argv[2]
function_name = sys.argv[3]
s3_bucket = sys.argv[4]
s3_key = sys.argv[5]


if stage == "mgmt":
  client = boto3.client("lambda")
else:
  boto_session = get_session(account_number, "TDRJenkinsLambdaRole" + stage.capitalize())
  client = boto_session.client("lambda")

client.update_function_code(FunctionName=function_name, S3Bucket=s3_bucket, S3Key=s3_key)
response = client.publish_version(FunctionName=function_name)
print(response["Version"])
