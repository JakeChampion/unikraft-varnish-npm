#!/usr/bin/env bash

set -eux

stunnel /etc/stunnel/stunnel.conf &
varnishd -F -a :6081 -f /etc/varnish/default.vcl -T none