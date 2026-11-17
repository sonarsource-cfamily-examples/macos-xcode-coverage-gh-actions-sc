#!/usr/bin/env bash
set -euo pipefail

# Convert the coverage of one or more *.xcresult bundles to the SonarQube Generic Test Data format.
# xccov reads *.xcresult bundles directly, so no xcresulttool export step is needed.

function convert_file {
  local xcresult="$1"
  local file_name="$2"
  echo "  <file path=\"$file_name\">"
  xcrun xccov view --archive --file "$file_name" "$xcresult" | \
    sed -n '
    s/^ *\([0-9][0-9]*\): 0.*$/    <lineToCover lineNumber="\1" covered="false"\/>/p;
    s/^ *\([0-9][0-9]*\): [1-9].*$/    <lineToCover lineNumber="\1" covered="true"\/>/p
    '
  echo '  </file>'
}

function xccov_to_generic {
  echo '<coverage version="1">'
  for xcresult in "$@"; do
    if [[ ! -d $xcresult ]]
    then
      echo "Coverage FILE NOT FOUND AT PATH: $xcresult" 1>&2;
      exit 1
    fi

    xcrun xccov view --archive --file-list "$xcresult" | while read -r file_name; do
      convert_file "$xcresult" "$file_name"
    done
  done
  echo '</coverage>'
}

xccov_to_generic "$@"
