#!/bin/sh
make pdf
make diff depth=1
make timediff at="2022-03-01 00:00"
make docx
