-- Lab 23 - who did what when: every action by a principal in a time window.
SELECT
  eventTime,
  userIdentity.arn        AS who,
  eventName               AS what,
  eventSource             AS service,
  sourceIPAddress         AS from_ip,
  awsRegion               AS region
FROM cloudtrail_logs
WHERE userIdentity.arn LIKE '%devops%'
  AND eventTime BETWEEN '2026-08-23T00:00:00Z' AND '2026-08-24T00:00:00Z'
ORDER BY eventTime DESC
LIMIT 100;
