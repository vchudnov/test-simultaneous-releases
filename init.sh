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

# Each of the worktrees created above is in a detached head state
# (corresponding to the tag). To make changes,
#
# 1. Create a working branch at the detached head, say "dev_fixes"
#
# 2. Develop and commit as usual
#
# 3. Go back to the the real submodule ("test_branched_releases"
# above), and create a new branch and possibly tags
#
# 4. Push and create the branch upstream (eg. git push --set-upstream
# dev_fixes)
#
# 5. Push any new tags: git push --tags

