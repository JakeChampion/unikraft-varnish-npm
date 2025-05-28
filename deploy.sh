#! /usr/bin/env bash

set -eux

kraft cloud deploy -p 443:6081 --follow .
