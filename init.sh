#!/bin/bash

BASE="$(git rev-parse --show-toplevel)"

pushd "$BASE"

git submodule init
git submodule update --recursive

pushd submodules/test-branched-releases

# "git worktree" is the official replacement of the previous,
# community-contributed git-new-workdir.
git worktree add ../tbs-1.1 release_1.1
git worktree add ../tbs-2.0 release_2.0

popd
