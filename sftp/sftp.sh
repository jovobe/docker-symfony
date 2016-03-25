#!/bin/sh

set -e
set -o xtrace

exec /usr/sbin/sshd -D
