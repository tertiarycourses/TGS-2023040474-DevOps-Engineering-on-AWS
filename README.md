# DevOps Engineering on AWS

Build practical skills for automating, operating, securing, and recovering workloads on AWS through 25 connected hands-on labs.

| Course detail | Information |
|---|---|
| Course code | `TGS-2023040474` |
| Programme | WSQ |
| Duration | 5 days / 40 hours |
| Current courseware | v12 (23 August 2026) |
| Registration | [View course details and register](https://www.tertiarycourses.com.sg/wsq-devops-engineering-on-aws.html) |
| Funding | Up to 70% course-fee funding may be available. Eligibility, validity dates, and other terms apply; check the registration page for current details. |

## About the course

This advanced WSQ course develops the practical capabilities needed to design and automate AWS delivery workflows, manage infrastructure as code, build resilient cloud solutions, implement monitoring and incident response, and apply security and compliance controls. The course aligns its slide deck, Learner Guide, Lesson Plan, assessments, and labs around a single five-day learning journey.

## Learning outcomes

By the end of the course, learners will be able to:

1. Implement automated software delivery workflows and CI/CD pipelines on AWS.
2. Provision and manage reusable cloud infrastructure through configuration management and infrastructure as code.
3. Design scalable, highly available, and recoverable AWS solutions.
4. Collect, analyse, and act on operational logs and metrics.
5. Route incidents and automate event-driven remediation.
6. Apply identity, encryption, audit, security-monitoring, and compliance controls at scale.

## Topics covered

- SDLC automation with Git, CodeBuild, CodePipeline, testing, artifacts, approvals, and deployment strategies
- Configuration management and infrastructure as code with CloudFormation, change sets, drift detection, Parameter Store, and StackSets
- Resilient cloud solutions using Multi-AZ architectures, Auto Scaling, disaster recovery, backups, and failure injection
- Monitoring and logging with CloudWatch metrics, dashboards, Logs Insights, alarms, and notifications
- Incident and event response with EventBridge, Lambda, and Systems Manager automation
- Security and compliance with IAM, Secrets Manager, KMS, CloudTrail, AWS Config, and Security Hub

## Labs

Each lab folder contains detailed instructions, an `INSTRUCTIONS.pdf` mirror, editable AWS-native source files, safe environment placeholders, and a unique architecture JPEG. There are exactly five labs per day.

### Day 1 — Foundations and SDLC automation

1. [Safe AWS and Git environment](labs/lab-01-safe-env-identity/)
2. [Source-control workflow and branching](labs/lab-02-source-workflow-branching/)
3. [Automated tests with AWS CodeBuild](labs/lab-03-codebuild-automated-tests/)
4. [Versioned build artifacts](labs/lab-04-versioned-artifacts-buildspec/)
5. [CodePipeline approval and deployment](labs/lab-05-codepipeline-approval-deploy/)

### Day 2 — Configuration management and infrastructure as code

6. [CloudFormation network baseline](labs/lab-06-cloudformation-network-baseline/)
7. [Parameterized application stack](labs/lab-07-parameterized-app-stack/)
8. [Change sets and drift detection](labs/lab-08-changesets-drift-detection/)
9. [SSM Parameter Store configuration](labs/lab-09-ssm-parameter-store-config/)
10. [Multi-account and multi-Region StackSets](labs/lab-10-multiaccount-region-stacksets/)

### Day 3 — Resilient cloud solutions

11. [Multi-AZ load balancing and Auto Scaling](labs/lab-11-multiaz-alb-autoscaling/)
12. [Target-tracking scaling and load validation](labs/lab-12-target-tracking-load-validation/)
13. [RTO/RPO disaster-recovery selection](labs/lab-13-rto-rpo-dr-selection/)
14. [Backup, restore, and data protection](labs/lab-14-backup-restore-data-protection/)
15. [Failure injection and self-healing](labs/lab-15-failure-injection-self-healing/)

### Day 4 — Monitoring, logging, and incident response

16. [CloudWatch metrics and dashboard](labs/lab-16-cloudwatch-metrics-dashboard/)
17. [Centralized logs and Logs Insights](labs/lab-17-centralized-logs-insights/)
18. [Metric filters, alarms, and SNS](labs/lab-18-metric-filters-alarms-sns/)
19. [EventBridge incident routing](labs/lab-19-eventbridge-incident-routing/)
20. [Lambda and Systems Manager auto-remediation](labs/lab-20-lambda-ssm-auto-remediation/)

### Day 5 — Security, compliance, and capstone

21. [IAM least-privilege analysis](labs/lab-21-iam-least-privilege-analysis/)
22. [Secrets Manager and KMS encryption](labs/lab-22-secrets-kms-encryption/)
23. [CloudTrail audit evidence](labs/lab-23-cloudtrail-audit-evidence/)
24. [AWS Config and Security Hub compliance](labs/lab-24-config-securityhub-compliance/)
25. [Capstone blueprint and evidence pack](labs/lab-25-capstone-blueprint-evidence-pack/)

## Public courseware package

- Trainer slide deck in PPTX and PDF formats
- Learner Guide in DOCX, PDF, and Markdown formats
- Lesson Plan in DOCX and PDF formats
- Twenty-five self-contained lab folders with editable working files and JPEG visuals

The public repository intentionally excludes assessments, answer keys, source references, private build tooling, QA renders, archives, credentials, and `.env` files. Assessments are distributed only through the controlled courseware and TMS channels. Never add live AWS credentials; use IAM roles and the provided `.env.example` placeholders.

## Provider

Conducted by Tertiary Infotech Academy Pte Ltd (UEN 201200696W).

© 2026 Tertiary Infotech Academy Pte Ltd. All rights reserved.
