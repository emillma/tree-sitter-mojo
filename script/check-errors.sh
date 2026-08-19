#!/usr/bin/env bash
# Parse every bundled Mojo example and reject recovery nodes.

set -eu
cd "$(dirname "$0")/.."

tree_sitter=${TREE_SITTER:-$PWD/node_modules/.bin/tree-sitter}
XDG_CACHE_HOME=${XDG_CACHE_HOME:-${TMPDIR:-/tmp}/tree-sitter-mojo-cache}
export XDG_CACHE_HOME
if ! command -v "$tree_sitter" >/dev/null 2>&1; then
    printf 'tree-sitter CLI not found: %s\n' "$tree_sitter" >&2
    exit 1
fi

total=0
fail=0

for file in examples/*.mojo; do
    status=0
    output=$("$tree_sitter" parse "$file" 2>&1) || status=$?
    errors=$(printf '%s\n' "$output" | grep -cE '\(ERROR|\(MISSING' || true)
    if [ "$status" -ne 0 ] && [ "$errors" -eq 0 ]; then
        printf 'tree-sitter failed while parsing %s:\n%s\n' "$file" "$output" >&2
        exit "$status"
    fi
    total=$((total + errors))
    if [ "$errors" -gt 0 ]; then
        printf '  %-30s %3d errors\n' "$(basename "$file")" "$errors"
        fail=$((fail + 1))
    else
        printf '  %-30s    OK\n' "$(basename "$file")"
    fi
done

printf '\nTotal ERROR/MISSING nodes: %d across %d files (%d failing)\n' \
    "$total" "$(find examples -name '*.mojo' -type f | wc -l | tr -d ' ')" "$fail"
[ "$total" -eq 0 ]
