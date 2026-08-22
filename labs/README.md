# Labs — DevOps Engineering on AWS

Twenty-five connected, self-contained hands-on labs for DevOps Engineering on AWS (TGS-2023040474) — **5 labs per day across 5 days (25 total)**, mapped to the six official DevOps-on-AWS domains.
Each folder has a detailed README.md (12–16 explicit steps), an INSTRUCTIONS.pdf mirror (4–6 pages), editable AWS-native source files, a .env.example (placeholders only) and a unique reference-architecture JPEG.


## Day 1 — Foundations and SDLC Automation

| Lab | Domain | Learning outcome | Folder |
|---|---|---|---|
| Lab 1: Set Up a Safe AWS & Git Working Environment and Verify Identity | 01 SDLC Automation | LO1 | `labs/lab-01-safe-env-identity/` |
| Lab 2: Establish a Source-Control Workflow and Branching for the Sample App | 01 SDLC Automation | LO1 | `labs/lab-02-source-workflow-branching/` |
| Lab 3: Run Automated Tests on Every Commit with AWS CodeBuild | 01 SDLC Automation | LO1 | `labs/lab-03-codebuild-automated-tests/` |
| Lab 4: Produce and Store Versioned Build Artifacts with a Buildspec | 01 SDLC Automation | LO1 | `labs/lab-04-versioned-artifacts-buildspec/` |
| Lab 5: Assemble a CodePipeline with Manual Approval and a Deployment Strategy | 01 SDLC Automation | LO1 | `labs/lab-05-codepipeline-approval-deploy/` |

## Day 2 — Configuration Management and IaC

| Lab | Domain | Learning outcome | Folder |
|---|---|---|---|
| Lab 6: Deploy a Reusable VPC Network Baseline with CloudFormation | 02 Configuration Management and IaC | LO2 | `labs/lab-06-cloudformation-network-baseline/` |
| Lab 7: Deploy a Parameterized Application Stack that Imports Network Exports | 02 Configuration Management and IaC | LO2 | `labs/lab-07-parameterized-app-stack/` |
| Lab 8: Preview Changes with Change Sets and Detect & Reconcile Drift | 02 Configuration Management and IaC | LO2 | `labs/lab-08-changesets-drift-detection/` |
| Lab 9: Externalize Configuration with SSM Parameter Store | 02 Configuration Management and IaC | LO2 | `labs/lab-09-ssm-parameter-store-config/` |
| Lab 10: Multi-Account, Multi-Region Guardrails with CloudFormation StackSets | 02 Configuration Management and IaC | LO2 | `labs/lab-10-multiaccount-region-stacksets/` |

## Day 3 — Resilient Cloud Solutions

| Lab | Domain | Learning outcome | Folder |
|---|---|---|---|
| Lab 11: Deploy a Multi-AZ Application Load Balancer with an Auto Scaling Group | 03 Resilient Cloud Solutions | LO3 | `labs/lab-11-multiaz-alb-autoscaling/` |
| Lab 12: Attach Target-Tracking Auto Scaling and Validate Scale-Out Under Load | 03 Resilient Cloud Solutions | LO3 | `labs/lab-12-target-tracking-load-validation/` |
| Lab 13: Select a DR Strategy by RTO/RPO and Implement a Pilot-Light Skeleton | 03 Resilient Cloud Solutions | LO3 | `labs/lab-13-rto-rpo-dr-selection/` |
| Lab 14: Automate Backup, Restore and Data Protection with AWS Backup | 03 Resilient Cloud Solutions | LO3 | `labs/lab-14-backup-restore-data-protection/` |
| Lab 15: Inject Failure and Verify Self-Healing with AWS FIS | 03 Resilient Cloud Solutions | LO3 | `labs/lab-15-failure-injection-self-healing/` |

## Day 4 — Monitoring, Logging, and Incident Response

| Lab | Domain | Learning outcome | Folder |
|---|---|---|---|
| Lab 16: Collect Custom Metrics with the CloudWatch Agent and Build an Operations Dashboard | 04 Monitoring and Logging | LO4 | `labs/lab-16-cloudwatch-metrics-dashboard/` |
| Lab 17: Centralise Logs in CloudWatch Logs and Analyse Them with Logs Insights | 04 Monitoring and Logging | LO4 | `labs/lab-17-centralized-logs-insights/` |
| Lab 18: Turn Logs into Signals: Metric Filters, CloudWatch Alarms and SNS Notifications | 04 Monitoring and Logging | LO4 | `labs/lab-18-metric-filters-alarms-sns/` |
| Lab 19: Route Incidents with Amazon EventBridge | 05 Incident and Event Response | LO5 | `labs/lab-19-eventbridge-incident-routing/` |
| Lab 20: Automated Remediation with Lambda and Systems Manager | 05 Incident and Event Response | LO5 | `labs/lab-20-lambda-ssm-auto-remediation/` |

## Day 5 — Security, Compliance, and Capstone

| Lab | Domain | Learning outcome | Folder |
|---|---|---|---|
| Lab 21: Enforce IAM Least Privilege and Analyse Policies for Over-Permissive Access | 06 Security and Compliance | LO6 | `labs/lab-21-iam-least-privilege-analysis/` |
| Lab 22: Protect Data with Secrets Manager and Customer-Managed KMS Encryption | 06 Security and Compliance | LO6 | `labs/lab-22-secrets-kms-encryption/` |
| Lab 23: Produce CloudTrail Audit Evidence and Answer Who-Did-What-When | 06 Security and Compliance | LO6 | `labs/lab-23-cloudtrail-audit-evidence/` |
| Lab 24: Run Continuous Compliance with AWS Config and Security Hub | 06 Security and Compliance | LO6 | `labs/lab-24-config-securityhub-compliance/` |
| Lab 25: Capstone — Blueprint, Well-Architected Review and Evidence Pack for the Whole Delivery System | 06 Security and Compliance | LO1–LO6 | `labs/lab-25-capstone-blueprint-evidence-pack/` |

> Never include live credentials. Use IAM roles and the `.env.example` placeholders only.
