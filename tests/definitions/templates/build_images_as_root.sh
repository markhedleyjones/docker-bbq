#!/usr/bin/env bash

# shellcheck disable=SC2034  # name is read by run_test() in test.sh

name="Build development image as root"
pass 'USER_NAME=root USER_UID=0 USER_GID=0 make'

name="Build production image as root"
pass 'USER_NAME=root USER_UID=0 USER_GID=0 make production'
