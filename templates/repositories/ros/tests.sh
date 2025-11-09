#!/usr/bin/env bash

# shellcheck disable=SC2034  # template_tests used by templates.sh

template_tests=(
  build_images_as_user.sh
  build_images_as_root.sh
  catkin_make.sh
  environment_variables.sh
  external_uris.sh
  package_manager.sh
  pip.sh
)
