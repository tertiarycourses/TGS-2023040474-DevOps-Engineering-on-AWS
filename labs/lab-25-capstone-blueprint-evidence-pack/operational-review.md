# Operational (Well-Architected-style) Review — Capstone

Score each item: **Met** / **Partly** / **Gap**. Record a pillar score (0–5) and the single top risk.

## Pillar 1 — Operational Excellence
- [ ] CI/CD pipeline delivers changes automatically with a manual approval gate (Lab 1)
- [ ] Infrastructure defined as code and reproducible (Labs 6–10)
- [ ] Runbooks exist for the common incidents (Lab 19–20)
- [ ] Changes are observable end-to-end (deployment + app metrics) (Lab 16–18)
- **Score: <0-5>**  · **Top risk / action: <...>**

## Pillar 2 — Security
- [ ] Least-privilege IAM + permission boundaries, verified with Access Analyzer (Lab 21)
- [ ] Data encrypted with customer-managed KMS keys; secrets rotated (Lab 22)
- [ ] Full audit trail with log-file validation (Lab 23)
- [ ] Continuous compliance via Config + Security Hub, no open NON_COMPLIANT (Lab 24)
- **Score: <0-5>**  · **Top risk / action: <...>**

## Pillar 3 — Reliability
- [ ] Multi-AZ, self-healing architecture (Lab 11–15)
- [ ] Defined and tested RTO/RPO; backups/snapshots in place
- [ ] Auto Scaling absorbs load; ALB health checks remove bad instances
- [ ] Automatic rollback on bad deploy (Lab 1)
- **Score: <0-5>**  · **Top risk / action: <...>**

## Pillar 4 — Performance Efficiency
- [ ] Right-sized compute; scaling policies tuned to real metrics
- [ ] Caching / connection strategy appropriate to the workload
- [ ] Metrics drive sizing decisions (not guesswork)
- **Score: <0-5>**  · **Top risk / action: <...>**

## Pillar 5 — Cost Optimization
- [ ] Resources torn down after labs; no idle spend
- [ ] Storage lifecycle / log retention configured
- [ ] Alarms on unexpected cost / usage
- **Score: <0-5>**  · **Top risk / action: <...>**

## Pillar 6 — Sustainability
- [ ] Compute scales to zero/minimum out of hours where possible
- [ ] Efficient instance families / managed services preferred
- [ ] Data retention minimised to what is required
- **Score: <0-5>**  · **Top risk / action: <...>**

## Summary
| Pillar | Score (0-5) | Top risk | Action / owner / date |
|---|---|---|---|
| Operational Excellence | | | |
| Security | | | |
| Reliability | | | |
| Performance Efficiency | | | |
| Cost Optimization | | | |
| Sustainability | | | |
