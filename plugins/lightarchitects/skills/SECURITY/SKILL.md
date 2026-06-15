---
name: SECURITY
description: "Security domain entry point — interactive menu for security audits, risk
  assessment, threat modeling, and authorized penetration testing workflows. Use when
  assessing attack surface, auditing dependencies, or running security-focused reviews.
  Triggers on: 'security', 'audit', 'vulnerabilities', 'threat model', 'pen test',
  'attack surface', 'CVE', 'supply chain risk'."
user-invocable: true
context: root
---

# /SECURITY — Security Domain

Security audits, risk scoring, threat modeling, and authorized penetration testing.
Select the workflow that matches your security task.

## Workflow Selection (HITL)

```
AskUserQuestion:
  question: "What security workflow do you need?"
  header: "Security"
  options:
    - label: "Security audit"
      description: "Static analysis + dependency audit — vulnerability pattern matching,
        supply-chain risk, OWASP Top 10, and deployment gate enforcement. → /SECURE"
    - label: "Risk assessment"
      description: "Blast-radius scoring per change — dependency CVE exposure, prior
        incident lookup, and research-gate evaluation. Fails the [R] gate on
        CRITICAL blast surface. → /RISK-ANALYSIS"
    - label: "Threat modeling"
      description: "Systematic threat surface identification — architecture risk analysis,
        trust boundary mapping, and attack vector enumeration via STRIDE/LINDDUN.
        → corso/SNIFF"
    - label: "Authorized penetration testing"
      description: "Structured red-team assessment for explicitly authorized targets —
        enumeration, examination, and finding report. Requires written authorization.
        → seraph/RED-TEAM"
```

**Route:**
- **Security audit** → invoke `Skill: SECURE`
- **Risk assessment** → invoke `Skill: RISK-ANALYSIS`
- **Threat modeling** → invoke `Skill: corso/SNIFF`
- **Authorized penetration testing** → invoke `Skill: seraph/RED-TEAM`

**Also available in this domain:** `seraph/AUDIT` (defensive audit) ·
`seraph/EXAMINE` (deep examination of a specific target) ·
`seraph/SURVEY` (enumeration sweep) · `corso/GUARD` (security gate evaluation)
