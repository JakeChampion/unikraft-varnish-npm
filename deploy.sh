#! /usr/bin/env bash

set -eux

kraft cloud deploy -p 6081:6081/tls -p 8443:8443/tls -M 2Gi --follow .
