#!/usr/bin/env zsh

source .env
true_hugo_version=$(hugo version | grep -E -o 'v([0-9.]+)' | grep -E -o '([0-9.]+)')
if [[ "$HUGO_VERSION" != "$true_hugo_version" ]]
then
  print -P '%F{red}Hugo Version Mismatch\n%F{reset}'
fi

hugo version
hugo server --logLevel debug --buildDrafts --enableGitInfo --printI18nWarnings --printPathWarnings
