#!/bin/sh
make pdf
make diff depth=1
make tagdiff tag="first_draft"
make docx
