#!/usr/bin/env bash
set -u

echo '=== DEVOPS TOOLCHAIN CHECK ==='
echo

check_tool() {
  local name="$1"
  local command_name="$2"
  if command -v "$command_name" >/dev/null 2>&1; then
	printf '%-12s %s\n' "${name}:" "$($command_name --version 2>/dev/null | head -n 1)"
	return 0
  fi
  printf '%-12s NOT INSTALLED\n' "${name}:"
  return 1
}

check_tool 'Git' git || true
check_tool 'Docker' docker || true
check_tool 'Node.js' node || true
check_tool 'VS Code' code || true

echo
echo 'Required tools: Git, Docker and VS Code'
echo 'Node.js is used by the demo application and is optional on the host when Docker is available.'
