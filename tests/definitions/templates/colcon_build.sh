#!/usr/bin/env bash

# shellcheck disable=SC2034  # name is read by run_test() in test.sh

name="Colcon build (system)"
pass 'cd ros2_ws && run colcon build'

name="Colcon build (custom cb script)"
# Test cb script from project root - it should work from any directory
pass 'cd .. && run cb'
