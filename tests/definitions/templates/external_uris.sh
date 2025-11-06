#!/usr/bin/env bash

# shellcheck disable=SC2034  # name is read by run_test() in test.sh

name="Downloading external URIs"
base_url="https://raw.githubusercontent.com/MarkHedleyJones/docker-bbq/main"
printf "${base_url}/LICENSE\n${base_url}/README.md\n" >build/urilist
pass make
rm build/urilist

name="Downloaded URI is in image"
pass "run sh -c 'cat /build/resources/LICENSE | grep \"MIT License\" && cat /build/resources/README.md | grep \"docker-bbq\"'"
