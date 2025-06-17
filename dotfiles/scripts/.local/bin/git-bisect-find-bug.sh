#!/bin/bash

# Find the faulty commit between one bad state and one good state of the code
# Usage: ./git-bisect-find-bug.sh <good_commit> <bad_commit> "<test_command>"
# For example" ./git-bisect-find-bug.sh abc123 HEAD "./run-tests.sh"
set -e

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <good_commit> <bad_commit> \"<test_command>\""
    exit 1
fi

GOOD_COMMIT=$1
BAD_COMMIT=$2
TEST_COMMAND=$3

# Save current branch or commit to return to it later
START_POINT=$(git rev-parse --abbrev-ref HEAD || git rev-parse HEAD)

echo "Starting git bisect..."
git bisect start "$BAD_COMMIT" "$GOOD_COMMIT"

# Run bisect with the provided test command
git bisect run bash -c "$TEST_COMMAND"

# Save the result of bisect
RESULT=$(git bisect log)

# End bisect and return to original state
git bisect reset

echo
echo "=== Bisect complete ==="
echo "$RESULT"
