#!/bin/sh
make pdf
make diff depth=1
make tagdiff tag="first_draft"
make tagdiff tag="first_draft_after_JS_corrections"
make docx
make clean
