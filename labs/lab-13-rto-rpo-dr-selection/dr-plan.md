# DR Strategy Selection Worksheet (Lab 13)

## 1. Workload targets
| Metric | Definition | Your target |
|---|---|---|
| RTO (Recovery Time Objective) | Max acceptable time to restore service | __________ |
| RPO (Recovery Point Objective) | Max acceptable data loss (time) | __________ |

## 2. Compare the four AWS DR strategies
| Strategy | Typical RTO | Typical RPO | Steady-state cost | Notes |
|---|---|---|---|---|
| Backup & Restore | Hours | Hours | Lowest | Restore infra + data from backups on demand |
| Pilot Light | 10s of minutes | Minutes | Low | Data kept warm (replication); core services off/minimal |
| Warm Standby | Minutes | Seconds-minutes | Medium | Scaled-down but always-on copy; scale up on failover |
| Active-Active | Near zero | Near zero | Highest | Both Regions serve live traffic simultaneously |

## 3. Decision
- Chosen strategy: __________________________
- Justification (map targets to the table above): __________________________
- DR Region: __________________________

## 4. Implemented in this lab
Pilot Light: S3 cross-Region replication (warm data) + a scaled-to-zero app tier
in the DR Region + a Route 53 failover record set, promoted per failover-notes.md.
