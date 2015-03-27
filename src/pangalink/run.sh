#!/usr/bin/env bash

puppet apply --modulepath=/src/pangalink/run/modules /src/pangalink/run/run.pp

/usr/bin/supervisord
