#!/usr/bin/env bash

# shellcheck disable=SC2034  # name is read by run_test() in test.sh

name='Valid template exits success'
pass 'bbq-create debian ${TESTREPO}'

name='Template directory created'
pass 'find . -type d | grep ${TESTREPO}'

name='Dont overwrite existing repo'
fail 'bbq-create debian ${TESTREPO}'

# Remove previously created repo
rm -rf ${TESTREPO}

name='Invalid template exits with failure'
fail 'bbq-create non-existant-template ${TESTREPO}'
