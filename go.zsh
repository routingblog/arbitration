#!/usr/bin/env zsh

hugo version
pre-commit run --all
markdownlint-cli2 --config .markdownlint-cli2.jsonc 'content/**/**.md'
vale content
# https://gohugo.io/troubleshooting/audit/
HUGO_MINIFY_TDEWOLFF_HTML_KEEPCOMMENTS=true HUGO_ENABLEMISSINGTRANSLATIONPLACEHOLDERS=true hugo && grep -inorE "<\!-- raw HTML omitted -->|ZgotmplZ|\[i18n\]|\(<nil>\)|(&lt;nil&gt;)|hahahugo" public/
grep -ir '"XXX"' content && (echo "FAILED"; exit 1)
