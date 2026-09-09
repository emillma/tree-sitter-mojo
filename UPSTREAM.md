# Upstream tracking — tree-sitter-mojo

- **Upstream repo**: https://github.com/shuklaayush/tree-sitter-mojo
  (remote `upstream-shuklaayush`)
- **Origin** (local fork): git@github.com:emillma/tree-sitter-mojo.git
- **Pinned base rev**: `b59b108b54328b14cb650aa210130e8efd34c8ba`
  (current HEAD of the local fork, branch `main`)
- **Local branch**: `main`
- **Local changes**: emillma's fork is 14 commits ahead of shuklaayush base —
  includes corpus-test updates for current grammar (`comptime_statement`,
  `variable_declaration`), inferred-member highlighting, and other local work.
  See `git log upstream-shuklaayush/main..HEAD` for the full list.
- **Last synced**: 2026-09-07

## Local state (in-flight, 2026-09-10)

- Untracked cli.py: Typer replacement for script/check-errors.sh (parse every examples/*.mojo, reject ERROR/MISSING nodes) — restructure in flight, not yet committed; the old script deletion is likewise uncommitted. Finish or discard before syncing upstream.
