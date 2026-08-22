# Evidence Pack Checklist — Capstone

Map every learning outcome to a concrete artifact from the prior labs. Each row must
point to a **present, non-empty** file in the evidence/ folder.

| LO | Domain | Lab(s) | Required evidence artifact | Stored at | Done |
|----|--------|--------|----------------------------|-----------|------|
| LO1 | 1 SDLC automation | 1–5 | CodePipeline all-green screenshot + build log | evidence/01-sdlc/ | [ ] |
| LO2 | 2 IaC & config mgmt | 6–10 | describe-stacks CREATE_COMPLETE + drift result | evidence/02-iac/ | [ ] |
| LO3 | 3 Resilience | 11–15 | ALB across 2 AZs + ASG self-heal + RTO/RPO note | evidence/03-resilience/ | [ ] |
| LO4 | 4 Monitoring & logging | 16–18 | Dashboard screenshot + alarm ARNs + Logs Insights result | evidence/04-observability/ | [ ] |
| LO5 | 5 Incident & event response | 19–20 | EventBridge rule + SNS notification + remediation log | evidence/05-response/ | [ ] |
| LO6 | 6 Security & compliance | 21–24 | Access Analyzer clean + KMS/Secrets + CloudTrail who-did-what-when + Config/Security Hub posture | evidence/06-security/ | [ ] |

## Cross-cutting evidence (whole system)
- [ ] Completed blueprint.md (all six domain sections filled)
- [ ] Completed operational-review.md (score + top risk per pillar)
- [ ] capstone-architecture.yaml validates / change-set shows nested stacks
- [ ] Final compliance posture: zero unexplained NON_COMPLIANT rules
- [ ] capstone-deliverable.zip assembled and handed over

## Sign-off
- Learner: <name>  · Date: <date>
- Reviewer/Trainer: <name>  · Date: <date>
