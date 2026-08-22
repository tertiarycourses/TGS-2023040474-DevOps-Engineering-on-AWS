-- Lab 23 - external Athena table over the CloudTrail S3 logs.
CREATE EXTERNAL TABLE IF NOT EXISTS cloudtrail_logs (
  eventVersion        STRING,
  userIdentity        STRUCT<type:STRING, principalId:STRING, arn:STRING, userName:STRING>,
  eventTime           STRING,
  eventSource         STRING,
  eventName           STRING,
  awsRegion           STRING,
  sourceIPAddress     STRING,
  userAgent           STRING,
  requestParameters   STRING,
  responseElements    STRING,
  resources           ARRAY<STRUCT<arn:STRING, accountId:STRING, type:STRING>>
)
ROW FORMAT SERDE 'com.amazon.emr.hive.serde.CloudTrailSerde'
STORED AS INPUTFORMAT 'com.amazon.emr.cloudtrail.CloudTrailInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://<trail-bucket>/AWSLogs/<your-account-id>/CloudTrail/';
