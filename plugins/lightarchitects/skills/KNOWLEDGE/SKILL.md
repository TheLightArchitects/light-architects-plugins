---
name: KNOWLEDGE
description: "Knowledge domain entry point — interactive menu for codebase onboarding,
  documentation enrichment, retrospectives, and build-queue synchronization. Use when
  capturing decisions, orienting a new developer, or preserving session learnings.
  Triggers on: 'knowledge', 'onboard', 'document this', 'save this decision', 'retro',
  'lessons learned', 'track this build', 'what did we decide'."
user-invocable: true
context: root
---

# /KNOWLEDGE — Knowledge Domain

Codebase orientation, decision capture, documentation enrichment, and retrospectives.
Select the workflow that matches your knowledge task.

## Workflow Selection (HITL)

```
AskUserQuestion:
  question: "What knowledge task do you need?"
  header: "Knowledge"
  options:
    - label: "Onboard to a codebase"
      description: "Structured codebase orientation — architecture survey, key entry
        points, historical context from git log, and a developer brief covering the
        patterns and abstractions you need to know. → /ONBOARD"
    - label: "Enrich & document"
      description: "Persist a significant decision, architecture choice, or lesson learned
        to the knowledge store using the 8-layer engineering schema: decision,
        alternatives rejected, lessons, constraints, patterns, debt, impact,
        next action. → /ENRICH"
    - label: "Retrospective"
      description: "Session retrospective — extract lessons learned, identify what worked
        and what didn't, and produce promotion candidates for standards governance.
        → /REFLECT"
    - label: "Sync build queue"
      description: "Place a validated plan into the build tracking artifacts with
        Northstar-aware queue ranking — priority bands, leverage scoring, and
        dependency classification. → /SYNC"
```

**Route:**
- **Onboard to a codebase** → invoke `Skill: ONBOARD`
- **Enrich & document** → invoke `Skill: ENRICH`
- **Retrospective** → invoke `Skill: REFLECT`
- **Sync build queue** → invoke `Skill: SYNC`

**Also available in this domain:** `/RESEARCH` (prior art and dependency investigation) ·
`/INVESTIGATE` (forensic analysis of past decisions)
