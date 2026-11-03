#!/bin/sh
# Native benchmark build only; deployment builds keep Goose's portable defaults.
exec gcc -march=native "$@"
