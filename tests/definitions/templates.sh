#!/usr/bin/env bash

# shellcheck disable=SC2034  # name is read by run_test() in test.sh
# shellcheck disable=SC2154  # test_template exported by test.sh

repositories_dir="${BASEDIR}/templates/repositories"
base_dir=$(pwd)

if [ ${test_template} == NULL ]; then
  # shellcheck disable=SC2207
  repositories=($(ls ${repositories_dir}))
else
  if [ ! -d "${BASEDIR}/templates/repositories/${test_template}" ]; then
    echo "Error: No template named ${test_template}"
    exit 1
  fi
  repositories=("${test_template}")
fi

test_create_repository() {
  name="Create repository"
  pass 'bbq-create "${repository}" ${TESTREPO}'
}

for repository in "${repositories[@]}"; do
  subheading "${repository} template"

  # This test is compulsory - it creates the repository
  test_create_repository

  if [ -f "${repositories_dir}/${repository}/tests.sh" ]; then
    source "${repositories_dir}/${repository}/tests.sh"
  fi
  # shellcheck disable=SC2154  # template_tests sourced from tests.sh above
  for test in "${template_tests[@]}"; do
    cd "${TESTDIR}/${TESTREPO}" || exit
    source "${BASEDIR}/tests/definitions/templates/${test}"
  done

  # Clean-up
  cd "${base_dir}" || exit
  rm -rf ${TESTREPO}
done
