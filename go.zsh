#!/usr/bin/env zsh

pre-commit run
markdownlint -c .markdownlint.jsonc content
vale content
