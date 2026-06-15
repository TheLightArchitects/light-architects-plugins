---
name: QUALITY
description: "Quality domain entry point — interactive menu for code review, plan compliance,
  gate evaluation, and multi-agent review workflows. Use when enforcing standards, checking
  quality, or running review cycles. Triggers on: 'quality', 'check quality', 'standards
  check', 'lint', 'code smell', 'review this', 'is this good enough'."
user-invocable: true
context: root
---

# /QUALITY — Quality Domain

Code review, standards enforcement, plan compliance, and multi-agent assessment.
Select the workflow that matches your quality task.

## Workflow Selection (HITL)

```
AskUserQuestion:
  question: "What quality workflow do you need?"
  header: "Quality"
  options:
    - label: "Code review"
      description: "Multi-lens review of a diff or file set — correctness, architecture,
        security, and coding standards checked in parallel. → /REVIEW"
    - label: "Plan compliance check"
      description: "Cross-examine a build plan for schema completeness, scoring honesty,
        Northstar alignment, and output contract — iterates until no blocking gaps.
        → /XEA"
    - label: "Gate evaluation"
      description: "Run one or more quality gate dimensions at a phase boundary or
        pre-merge: architecture, security, quality, operations, performance, testing,
        documentation, research. → /GATE"
    - label: "Multi-agent review"
      description: "Dispatch multiple specialist agents as independent reviewers in up to
        3 rounds — structural defects, cross-amendment contradictions, and verdict
        upgrade. → /SCRUM"
```

**Route:**
- **Code review** → invoke `Skill: REVIEW`
- **Plan compliance check** → invoke `Skill: XEA`
- **Gate evaluation** → invoke `Skill: GATE`
- **Multi-agent review** → invoke `Skill: SCRUM`

**Also available in this domain:** `/CODE-VERIFY` (run linter + tests directly) ·
`/OPTIMIZE` (performance quality) · `corso/CHOW` (architecture-focused deep review)
