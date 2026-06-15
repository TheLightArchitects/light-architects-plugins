---
name: ENGINEER
description: "Engineering domain entry point — interactive menu for architecture, planning,
  implementation, review, and delivery workflows. Use when starting any engineering task
  and want to pick the right phase-flow entry point. Triggers on: 'engineer', 'build a
  feature', 'implement', 'start a build', 'architect', 'ship something'."
user-invocable: true
context: root
---

# /ENGINEER — Engineering Domain

Architecture, planning, implementation, code review, and delivery. Select the workflow
that matches where you are in the build cycle.

## Workflow Selection (HITL)

```
AskUserQuestion:
  question: "What do you want to do?"
  header: "Engineering"
  options:
    - label: "Plan a feature"
      description: "Draft a structured build plan — tier sizing, phase map, file-function
        map, risk register, and quality gates. Produces a validated plan ready for
        implementation. → /PLAN"
    - label: "Build & implement"
      description: "Execute a full feature build pipeline from a validated plan — worktree
        isolation, per-phase quality gates, and pre-merge gate before PR. → /BUILD"
    - label: "Review code"
      description: "Multi-lens code review — correctness, architecture, security, and
        standards in parallel. Optional auto-fix pass. → /REVIEW"
    - label: "Deploy & ship"
      description: "Build release binary, sign, deploy to target, and verify the service
        is live. → /DEPLOY"
```

**Route:**
- **Plan a feature** → invoke `Skill: PLAN`
- **Build & implement** → invoke `Skill: BUILD`
- **Review code** → invoke `Skill: REVIEW`
- **Deploy & ship** → invoke `Skill: DEPLOY`

**Also available in this domain:** `/CODE-VERIFY` (quick correctness check) ·
`/SYNC` (place a validated plan into the build queue) · `/VERIFY` (run the full test suite)
