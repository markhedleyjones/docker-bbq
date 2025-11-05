#!/usr/bin/env bash

subheading "Dockerfile linting"

generated_repos_dir="${TESTDIR}/generated-lint-repos"

# Generate all Dockerfiles using shared script
name="Generate all test repositories"
pass "${BASEDIR}/tests/generate-test-dockerfiles.sh ${generated_repos_dir}"

# Check if hadolint is installed
if ! command -v hadolint &>/dev/null; then
	echo ""
	echo "   WARNING: hadolint not installed - skipping linting step"
	echo "   Install hadolint to run these tests locally: https://github.com/hadolint/hadolint"
	echo ""
	return 0
fi

# Lint all generated Dockerfiles
repositories_dir="${BASEDIR}/templates/repositories"
repositories=($(ls ${repositories_dir}))

for repository in ${repositories[*]}; do
	name="Lint ${repository} Dockerfile"
	pass "hadolint --config ${BASEDIR}/.hadolint.yaml ${generated_repos_dir}/test-${repository}/Dockerfile"
done

rm -rf "${generated_repos_dir}"
