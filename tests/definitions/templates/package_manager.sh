#!/usr/bin/env bash

# shellcheck disable=SC2034  # name is read by run_test() in test.sh

name="System package installation"
printf "tinyproxy\nranger" >build/packagelist
pass make

name="System packages installed"
pass 'run tinyproxy -v | grep "tinyproxy"'

name="Packagelist intact after build"
pass 'cat build/packagelist | grep tinyproxy > /dev/null'
echo "" >build/packagelist
