---
name: RESEARCH
description: "Research domain entry point — interactive menu for systematic investigation,
  risk analysis, targeted research, and codebase orientation. Use when you need to
  investigate an unknown, assess a risk, research prior art, or orient in a new area.
  Triggers on: 'research', 'investigate', 'find out', 'prior art', 'how does X work',
  'is this safe', 'what are the risks', 'trace the root cause', 'evidence'."
user-invocable: true
context: root
---

# /RESEARCH — Research & Investigation Domain

Systematic investigation, risk analysis, targeted research, and knowledge discovery.
Select the workflow that matches your research task.

## Workflow Selection (HITL)

```
AskUserQuestion:
  question: "What research task do you need?"
  header: "Research"
  options:
    - label: "Systematic investigation"
      description: "Full evidence-first investigation cycle: scan → sweep → trace →
        probe → theorize → verify → close. Use for bug tracing, root-cause analysis,
        hypothesis testing, and forensic research. → /INVESTIGATE"
    - label: "Risk analysis"
      description: "Blast-radius scoring per change — dependency CVE exposure, prior
        incident lookup, and [R] gate evaluation. Fails hard on CRITICAL blast surface.
        → /RISK-ANALYSIS"
    - label: "Prior art & dependency research"
      description: "Structured prior art survey — Context7 library docs, web sources,
        academic papers, dependency audit, and evidence-chain with confidence tiers
        (VERIFIED / MULTI-SOURCE / SINGLE-SOURCE / INFERRED). → /INVESTIGATE"
    - label: "Codebase orientation"
      description: "Rapid orientation in an unfamiliar codebase or project area —
        architecture survey, entry points, key patterns, and a developer brief.
        → /ONBOARD"
```

**Route:**
- **Systematic investigation** → invoke `Skill: quantum/INVESTIGATE`
- **Risk analysis** → invoke `Skill: RISK-ANALYSIS`
- **Prior art & dependency research** → invoke `Skill: quantum/INVESTIGATE`
- **Codebase orientation** → invoke `Skill: ONBOARD`

**Also available in this domain:** `/SECURE` (security-focused research) ·
`/REFLECT` (extract and preserve research findings as decisions)
