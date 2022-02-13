#!/usr/bin/env sh
set -e

npmPackages="$(find /node_modules -type d -mindepth 1 -maxdepth 1)"

for packagePath in $npmPackages; do
  yarn link --cwd "$packagePath"
  packageName=$(jq -r ".name" < "$packagePath/package.json")
  yarn link "$packageName"
done

exec "$@"
