#!/bin/bash
# Reusable AYIN HTTP API helper for hook scripts.
#
# Usage:
#   source "${CLAUDE_PLUGIN_ROOT}/hooks/lib/ayin-query.sh"
#   result=$(ayin_query "sessions")
#   result=$(ayin_query "spans/corso/2026-04-21" 5)
#
# Returns: JSON body on success, empty string on failure.
# All failures are silent — AYIN being offline is expected.

AYIN_BASE_URL="${AYIN_BASE_URL:-http://localhost:3742}"

# Query an AYIN API endpoint.
#
# Args:
#   $1 — endpoint path (appended to /api/)
#   $2 — timeout in seconds (default: 3)
#
# Returns: stdout = JSON body, exit 0 on success, exit 1 on failure.
ayin_query() {
  local endpoint="$1"
  local timeout="${2:-3}"
  curl -sf --max-time "$timeout" "${AYIN_BASE_URL}/api/${endpoint}" 2>/dev/null
}

# Check if AYIN is reachable (fast probe).
#
# Returns: exit 0 if reachable, exit 1 otherwise.
ayin_available() {
  curl -sf --max-time 1 "${AYIN_BASE_URL}/api/sessions" >/dev/null 2>&1
}
