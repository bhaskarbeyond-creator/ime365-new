# Performance Test Plan

No benchmark is claimed by this audit.

## Workloads

- public home/config/blog at steady and burst traffic;
- authenticated resume save/read with realistic and maximum document sizes;
- 1/10/50-page PDF and DOCX exports under bounded concurrency;
- template catalog/admin operations;
- webhook bursts/replay;
- migration/startup and worker restart;
- DB/provider latency and failure injection.

## Measures

p50/p95/p99 latency, error rate, event-loop lag, CPU, RSS/heap, DB pool wait/queries, external calls, queue depth, Chromium process count, export bytes/time, rate-limit fairness and recovery time.

## Pass budgets

Owners must define SLO-derived numeric budgets before execution. The test fails on memory/process leaks, unbounded queueing, pool exhaustion, cross-user throttling or post-load non-recovery. Conditions, fixtures, versions and hardware are retained with results.
