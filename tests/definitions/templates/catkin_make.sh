#!/usr/bin/env bash

# shellcheck disable=SC2034  # name is read by run_test() in test.sh

name="Catkin build (system)"
pass 'cd catkin_ws && run catkin_make'

name="Catkin build (custom cm script)"
# Test cm script from project root - it should work from any directory
pass 'cd .. && run cm'
