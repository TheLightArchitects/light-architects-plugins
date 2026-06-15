---
name: TESTING
description: "Testing domain entry point — interactive menu for test suite execution,
  code quality checks, gate evaluation, and performance/coverage analysis. Use when
  validating correctness, enforcing coverage, or running pre-merge quality gates.
  Triggers on: 'testing', 'run tests', 'test coverage', 'write tests', 'quality gate',
  'is this correct', 'verify this works', 'pre-merge check'."
user-invocable: true
context: root
---

# /TESTING — Testing Domain

Test execution, coverage enforcement, gate evaluation, and performance analysis.
Select the workflow that matches your testing task.

## Workflow Selection (HITL)

```
AskUserQuestion:
  question: "What testing task do you need?"
  header: "Testing"
  options:
    - label: "Run full test suite"
      description: "Execute the six-suite test pyramid — unit, integration, property,
        E2E, regression, and smoke tests. Enforces ≥90% coverage and reports failures
        per suite. → /VERIFY"
    - label: "Quick correctness check"
      description: "Fast lint + compile + unit test pass without the full pyramid — use
        when you want rapid feedback during active development. → /CODE-VERIFY"
    - label: "Gate evaluation"
      description: "Run one or more LASDLC quality gates at a phase boundary — testing
        gate [T], architecture [A], or the full set before a PR merge. → /GATE"
    - label: "Performance & test strategy"
      description: "Infer the right test strategy for the change, detect performance
        bottlenecks, select metrics, and analyze infrastructure coverage. → corso/CHASE"
```

**Route:**
- **Run full test suite** → invoke `Skill: VERIFY`
- **Quick correctness check** → invoke `Skill: CODE-VERIFY`
- **Gate evaluation** → invoke `Skill: GATE`
- **Performance & test strategy** → invoke `Skill: corso/CHASE`

**Also available in this domain:** `/REVIEW` (code review with correctness lens) ·
`/RISK-ANALYSIS` (blast-radius scoring before shipping)
