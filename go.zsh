#!/usr/bin/env zsh

pre-commit run
markdownlint -c .markdownlint.jsonc content
vale content
# https://gohugo.io/troubleshooting/audit/
HUGO_MINIFY_TDEWOLFF_HTML_KEEPCOMMENTS=true HUGO_ENABLEMISSINGTRANSLATIONPLACEHOLDERS=true hugo && grep -inorE "<\!-- raw HTML omitted -->|ZgotmplZ|\[i18n\]|\(<nil>\)|(&lt;nil&gt;)|hahahugo" public/
