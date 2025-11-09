#!/usr/bin/env bash

# shellcheck disable=SC2034  # name is read by run_test() in test.sh

# Check if shellcheck is installed
if ! command -v shellcheck &>/dev/null; then
	echo ""
	echo -e "   \e[33mWARNING:\e[0m shellcheck not installed - skipping shell script linting"
	echo "   Install shellcheck to run these tests locally"
	echo ""
	return 0
fi

subheading "Shell script linting"

# Find all shell scripts (files with .sh extension or bash shebang)
shell_scripts=$(find "${BASEDIR}" -type f \( -name "*.sh" -o -executable \) \
	! -path "*/\.git/*" \
	! -path "*/media/*" \
	! -path "*/generated-test-repos/*" \
	-exec grep -l "^#!/.*bash" {} \; 2>/dev/null | sort -u)

for script in ${shell_scripts}; do
	name="Shellcheck $(basename ${script})"
	pass "shellcheck --severity=warning ${script}"
done
