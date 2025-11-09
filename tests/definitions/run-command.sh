#!/usr/bin/env bash

# shellcheck disable=SC2034  # name is read by run_test() in test.sh

bbq-create debian ${TESTREPO} >/dev/null 2>&1
cd ${TESTREPO} || exit
repo_path=$(pwd)

# Standard
make >/dev/null 2>&1
printf "#!/usr/bin/env sh\necho boom\n" >workspace/target.sh
chmod +x workspace/target.sh
subheading "Development builds"

name="Run command in container"
pass "run rm --help | grep 'Remove (unlink) the FILE(s).'"

name="Run target from repository root"
pass "run workspace/target.sh | grep boom"

cd "${repo_path}/workspace" || exit
name="Run target from inside workspace"
pass "run ./target.sh | grep boom"

cd /tmp || exit
name="Run target outside repository"
pass "run --repo ${repo_path} workspace/target.sh | grep boom"

cd "${repo_path}" || exit
name="Host repo path is set"
pass "run printenv | grep -E '^DOCKER_BBQ_HOST_REPO_PATH='"

name="Host workspace path is set"
pass "run printenv | grep -E '^DOCKER_BBQ_HOST_WORKSPACE_PATH='"

name="Container workspace path is set"
pass "run printenv | grep -E '^DOCKER_BBQ_CONTAINER_WORKSPACE_PATH='"
