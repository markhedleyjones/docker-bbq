#!/usr/bin/env bash

# shellcheck disable=SC2034  # name is read by run_test() in test.sh

name="Build development image as user"
pass 'USER_NAME=user make'

name="Build production image as user"
pass 'USER_NAME=user make production'
