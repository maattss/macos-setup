---
name: clean-worktrees
description: Remove all git worktrees in the current repo except the main working tree. Use when user says "/clean-worktrees" or wants to clean up, delete, or remove worktrees.
user_invocable: true
model: haiku
allowed-tools: Bash(git worktree:*)
---

# Clean Worktrees

Remove all git worktrees except the main working tree.

## Process

1. Run `git worktree list` to see all worktrees.
2. The **first entry** is always the main working tree — never remove it.
3. For every other entry, run `git worktree remove <path>`. If a worktree has uncommitted changes, it will fail — use `--force` and warn the user which worktree had uncommitted work.
4. Run `git worktree prune` to clean up any stale references.
5. Report what was removed.
