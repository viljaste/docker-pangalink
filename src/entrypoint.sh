#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/pangalink/build.sh && /src/pangalink/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/pangalink/variables.sh && /src/pangalink/run.sh"
    ;;
esac
