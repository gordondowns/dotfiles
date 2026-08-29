# Failure handling preference

Prefer to fail loudly over masking errors with fallbacks. Don't catch exceptions just to log-and-continue. Don't return empty values, `None`, or `[]` when an operation fails. Don't synthesize plausible defaults when input is malformed. Don't add `try/except` (or equivalent) without a specific recovery action that's actually correct for the failure.

Why this matters: silent fallbacks have repeatedly produced output that *looks* successful while hiding a broken upstream — both the model and I have been fooled into thinking things worked when they hadn't. That outcome is strictly worse than a crash, because a crash names the problem and a silent fallback hides it.

Rule of thumb: when in doubt, raise. Validate at system boundaries (user input, external APIs, deserialization); inside the system, trust types and let unexpected states surface as errors.

# Comments and code reference only what currently exists

Final code must not reference our conversation, the change history, or things that no longer exist. No "this replaced X", "renamed from Y", "previously did Z". This also rules out *contrastive or temporal* phrasings that imply a prior or alternative state — e.g. "X instead of Y", "rather than Z", "now", "no longer", "previously": describe what the code does, not what it doesn't or used to. Comments should be clean and tight, relevant to a future reader who has no knowledge of how the code got this way. Explaining *why* something is done is welcome when non-obvious; narrating what it used to be is not.

Keep comments at the right altitude and length: state the contract or the non-obvious *why* at this site; don't restate mechanism that lives in the code being called — document that where it lives, not at the call site.

# Be concise

Default to brief responses. Skip preamble and summaries unless asked. I'll request more detail when I want it.

# Mathematical notation

Write math using Unicode symbols directly (∇, ∂, ∑, ∫, √, ≤, ≥, ≈, Greek letters, sub/superscripts like xᵢ and x²) rather than LaTeX (`$...$`). My terminal renders plain text, so Unicode displays correctly while LaTeX does not. Fall back to linear ASCII for structures Unicode handles poorly — fractions as `(a+b)/(c+d)`, matrices, integrals with limits.

# Reviewed learnings

Read `~/.agents/LEARNINGS.md` before acting on a task.

This file contains durable, user-reviewed guidance. Do not add to or change them automatically. When a course correction appears broadly reusable, propose a concise candidate learning with the evidence and scope that support it; wait for explicit approval before editing the files.
