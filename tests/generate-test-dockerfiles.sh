#!/usr/bin/env bash

# Generates Dockerfiles from all templates for testing purposes.
# Used by both local tests and CI to ensure consistent generation.

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Default output directory
OUTPUT_DIR="${1:-generated-test-repos}"

echo "Generating test Dockerfiles to ${OUTPUT_DIR}..."

# Clear output directory if it exists
rm -rf "${OUTPUT_DIR}"
mkdir -p "${OUTPUT_DIR}"

for template_dir in "${REPO_ROOT}/templates/repositories/"*/; do
	template=$(basename "$template_dir")
	echo "  Generating ${template} template..."
	"${REPO_ROOT}/bin/bbq-create" --no-git "${template}" "${OUTPUT_DIR}/test-${template}"
done

echo "Generation complete: ${OUTPUT_DIR}"
