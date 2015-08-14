#!/usr/bin/env bash
exec fsharpi --quiet --exec "$1" -- "${@:2}"
