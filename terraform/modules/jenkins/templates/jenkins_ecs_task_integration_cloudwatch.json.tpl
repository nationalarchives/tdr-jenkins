{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": "logs:DescribeLogGroups",
      "Resource": "*"
    },
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": [
        "logs:PutLogEvents",
        "logs:DescribeLogStreams",
        "logs:CreateLogStream"
      ],
      "Resource": "arn:aws:logs:eu-west-2:${account_id}:log-group:/ecs/tdr-jenkins-mgmt:*"
    }
  ]
}