# Technical Blueprint — Integrated DevOps Delivery System (Capstone)

> Fill every **<...>** placeholder. Cross-reference the lab that produced each artifact.
> This blueprint ties Domains 1–6 into ONE secured, resilient, observable delivery
> system for the sample app.

## 0. System overview
- **Application:** DevOps sample web app
- **Regions / AZs:** <ap-southeast-1, AZ a + AZ b>
- **One-paragraph description of the end-to-end flow:** <commit → build/test → approve →
  deploy to multi-AZ → observe → alert/remediate → audit/comply>
- **Reference architecture diagram:** see lab-25-capstone-blueprint-evidence-pack.jpg

## 1. Domain 1 — SDLC Automation (LO1)  · Labs 1–5
- Source control & branching strategy: <trunk-based, protected main, PR gate>
- CI/CD pipeline stages: <Source (CodeConnections) → Build/Test (CodeBuild) → Approve → Deploy (CodeDeploy)>
- Rollback strategy: <alarm-based CodeDeploy auto-rollback>
- Evidence: <link to Lab 1 pipeline screenshot / build log>

## 2. Domain 2 — Configuration Management & IaC (LO2)  · Labs 6–10
- IaC tooling & stacks: <CloudFormation stacks: devops-net, devops-app, ...>
- Parameterisation / reproducibility: <parameters, exports/imports, drift detection>
- Config/state management: <SSM Parameter Store / Secrets Manager>
- Evidence: <describe-stacks output / drift result>

## 3. Domain 3 — Resilient Cloud Solutions (LO3)  · Labs 11–15
- High availability design: <multi-AZ ALB + Auto Scaling group + Multi-AZ RDS>
- Self-healing: <ASG replaces unhealthy instances; ELB health checks>
- **RTO:** <e.g. 5 min>  · **RPO:** <e.g. 5 min>
- Evidence: <ALB across 2 AZs / ASG activity history>

## 4. Domain 4 — Monitoring & Logging (LO4)  · Labs 16–18
- Metrics & dashboard: <CloudWatch dashboard name>
- Log aggregation & queries: <log group /devops/app, metric filters, Logs Insights>
- Alarms: <latency / error-rate / CPU alarms + SNS>
- Evidence: <dashboard screenshot / alarm ARNs>

## 5. Domain 5 — Incident & Event Response (LO5)  · Labs 19–20
- Event detection: <EventBridge rule pattern>
- Notification: <SNS topic + subscribers>
- Auto-remediation: <remediation Lambda action>
- Runbook: <link to runbook / on-call process>
- Evidence: <rule config / remediation log>

## 6. Domain 6 — Security & Compliance (LO6)  · Labs 21–24
- Identity & least privilege: <scoped policy + permission boundary + Access Analyzer result> (Lab 21)
- Data protection: <customer-managed KMS key, Secrets Manager rotation, deny-unencrypted S3> (Lab 22)
- Audit: <multi-Region CloudTrail, log-file validation, who-did-what-when query> (Lab 23)
- Continuous compliance: <AWS Config rules + conformance pack + Security Hub posture score> (Lab 24)
- Evidence: <Access Analyzer / KMS / CloudTrail / Config-Security Hub artifacts>

## 7. End-to-end trace (prove it connects)
Describe one real change travelling the whole system:
1. <Commit pushed to protected main>
2. <Pipeline builds, tests, waits for approval, deploys>
3. <Traffic served by multi-AZ ALB/ASG; RDS healthy>
4. <CloudWatch shows latency/errors; alarm quiet>
5. <If an alarm fires, EventBridge notifies + Lambda remediates>
6. <CloudTrail records every API call; Config/Security Hub confirm COMPLIANT>

## 8. Known risks & next steps
- <Top 3 residual risks and the action + owner + date for each>
