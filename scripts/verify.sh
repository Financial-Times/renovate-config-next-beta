#!/bin/bash

git status --porcelain | if grep --quiet "\<renovate.json\>"

then
  echo "❗️ Please modify the 'renovate-config.json5' file instead of the 'renovate.json' file. For more information see https://github.com/Financial-Times/renovate-config-next#development"
  exit 1
fi