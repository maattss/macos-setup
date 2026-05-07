---
name: plan-issues
description: Analyze open GitHub issues in the current repo and create an implementation plan to address them. Use when user says "/plan-issues" or wants to triage, plan, or tackle open issues. Caps at 25 issues by default.
user_invocable: true
argument-hint: [max-issues]
allowed-tools: Bash(gh issue list:*), Bash(gh issue view:*), Bash(gh label list:*), Bash(git log:*), Bash(git blame:*)
---

# Plan Issues

Analyze open GitHub issues and produce an implementation plan.

## Hard limit

**Max issues: 25** (default). The user can pass a different number as an argument (e.g., `/plan-issues 10`), but never exceed 50 regardless of what's requested. If the repo has more open issues than the limit, tell the user how many were skipped and suggest filtering by label or milestone.

## Process

### Step 1: Fetch issues

```bash
gh issue list --state open --limit <max> --json number,title,body,labels,assignees,milestone,createdAt,updatedAt
```

If the total open issue count is higher than the limit, also run:

```bash
gh issue list --state open --json number --jq 'length'
```

to report the full count.

### Step 2: Triage and group

Read through every fetched issue. For each one, determine:

- **What it is**: bug, feature request, improvement, docs, chore
- **Scope**: small (< 1 hour), medium (hours), large (days), unclear
- **Dependencies**: does fixing this require another issue to be done first?

Group issues into logical clusters — things that touch the same area of the codebase or are otherwise related. Read relevant source files to validate your scope estimates and understand the actual work involved.

### Step 3: Identify quick wins and blockers

- **Quick wins**: small scope, no dependencies, high value. These go first.
- **Blockers**: issues that other issues depend on. These also go first.
- **Unclear issues**: issues where the problem or ask is vague. Flag these — they need clarification before they can be planned.

### Step 4: Write the plan

Output the plan directly to the user in this format:

---

## Issue Plan

**Repo:** owner/repo
**Open issues:** X total, Y analyzed

### Unclear / Needs Triage

Issues that can't be planned without more information:

- #N — [title]: what's missing (e.g., "no repro steps", "feature request with no scope defined")

### Phase 1: Quick Wins & Blockers

Issues that should be tackled first — either because they're fast or because other work depends on them.

| # | Title | Type | Est. Scope | Why First |
|---|-------|------|-----------|-----------|
| #N | ... | bug | small | blocks #M |

### Phase 2: Core Work

The main body of work, ordered by suggested priority.

| # | Title | Type | Est. Scope | Notes |
|---|-------|------|-----------|-------|
| #N | ... | feature | medium | related to #M, touch same files |

### Phase 3: Low Priority / Nice to Have

Issues that are real but not urgent.

| # | Title | Type | Est. Scope | Notes |
|---|-------|------|-----------|-------|

### Suggested Order

A numbered sequence for tackling these, with brief reasoning for the ordering:

1. #N — reason
2. #M, #O (can be parallelized) — reason
3. ...

### Clusters

Groups of related issues that should be worked on together or by the same person:

- **[area name]**: #N, #M — why they're related

---

## Rules

- Do NOT assign issues, close issues, or comment on issues. This is read-only analysis.
- Scope estimates should be grounded in actually reading the relevant code, not guessing from the title alone.
- If an issue is a duplicate of another, note it but don't drop it from the plan — the user decides what to close.
- Be honest about uncertainty. "Unclear scope — need to investigate X" is better than a fake estimate.
- Keep the output scannable. Tables for the bulk, prose only where reasoning is needed.
