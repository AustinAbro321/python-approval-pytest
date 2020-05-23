set -e

# ------------------------------------------------------------------------
# cyber-dojo returns text files under /sandbox that are
# created/deleted/changed. In tidy_up you can remove any
# such files you don't want returned to the browser.

trap tidy_up EXIT

function tidy_up()
{
  delete_dirs .pytest_cache
}

function delete_dirs()
{
  for dirname in "$@"
  do
      rm -rf "${dirname}" 2> /dev/null || true
  done
}

# ------------------------------------------------------------------------
# https://github.com/approvals/ApprovalTests.Python
# https://approvaltests.com/

pytest --approvaltests-use-reporter='PythonNative'
