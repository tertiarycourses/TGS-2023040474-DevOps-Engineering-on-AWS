# Failover Runbook (Pilot Light -> Live)

Trigger: Route 53 PRIMARY health check reports Unhealthy for the primary endpoint.

1. Data: promote the RDS cross-Region read replica (or restore the latest
   automated snapshot) in the DR Region and note the new writer endpoint.
2. Config: point the DR app tier at the promoted database endpoint.
3. Compute: scale the DR Auto Scaling group up from 0
   `aws autoscaling update-auto-scaling-group --auto-scaling-group-name dr-pilot-asg --min-size 2 --desired-capacity 2 --region ap-southeast-2`
4. Verify: confirm DR targets are healthy and the app answers HTTP 200.
5. Traffic: the Route 53 SECONDARY record now serves (failover is automatic once
   PRIMARY is unhealthy); confirm resolution points at the DR endpoint.

Fail-back (after primary recovers):
- Re-establish primary data as source of truth, re-enable replication toward DR,
  scale the DR group back to 0, and let Route 53 restore PRIMARY.
