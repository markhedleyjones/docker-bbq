#!/usr/bin/env bash

# shellcheck disable=SC2034  # name is read by run_test() in test.sh

name="PIP package installation"
printf "meowsay\ndinosay" >build/pip3-requirements.txt
pass make
rm build/pip3-requirements.txt

name="PIP package installed"
pass 'run dinosay -d trice "Dinosaurs" | grep "Dinosaurs"'
