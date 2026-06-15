---
name: OPS
description: "Operations domain entry point — interactive menu for deployment, observability,
  performance optimization, and verification workflows. Use when operating, monitoring, or
  shipping running systems. Triggers on: 'ops', 'deploy', 'monitor', 'observe', 'latency',
  'performance', 'slow', 'debug runtime', 'optimize', 'ship it'."
user-invocable: true
context: root
---

# /OPS — Operations Domain

Deployment, runtime observability, performance optimization, and system verification.
Select the workflow that matches your operational task.

## Workflow Selection (HITL)

```
AskUserQuestion:
  question: "What operations task do you need?"
  header: "Operations"
  options:
    - label: "Deploy"
      description: "Build, sign, and deploy a release binary or service. Writes a deploy
        manifest and verifies the service is live after deployment. → /DEPLOY"
    - label: "Observe & debug"
      description: "Runtime diagnostics — trace spans, session timelines, latency
        analysis, and forensic root-cause investigation on a live or recorded
        execution. → /OBSERVE"
    - label: "Optimize performance"
      description: "Profiler-guided performance improvement — bottleneck detection,
        concurrency analysis, throughput modeling (Little's Law / Amdahl), and ranked
        optimization proposals. → /OPTIMIZE"
    - label: "Verify & test"
      description: "Run the full test pyramid — unit, integration, property, E2E,
        regression, and smoke tests. Reports coverage and flags regressions. → /VERIFY"
```

**Route:**
- **Deploy** → invoke `Skill: DEPLOY`
- **Observe & debug** → invoke `Skill: OBSERVE`
- **Optimize performance** → invoke `Skill: OPTIMIZE`
- **Verify & test** → invoke `Skill: VERIFY`

**Also available in this domain:** `/CODE-VERIFY` (quick lint + compile check) ·
`corso/CHASE` (test strategy and infrastructure analysis)
