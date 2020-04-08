#!/usr/bin/env bash

_find_blade_root () {
  local dir
  dir=$PWD;
  while [ "$dir" != "/" ]; do
    if [ -f "$dir/BLADE_ROOT" ]; then
      echo "$dir"
      return 0
    fi;
    dir=`dirname "$dir"`
  done
  return 1
}

blade () {
  BLADE_ROOT=`_find_blade_root`
  if [ -z $BLADE_ROOT ]; then
    echo "Unable to find BLADE_ROOT"
    return 1
  fi
  docker run -i -t -w $PWD \
  -e BLADE_ROOT=$BLADE_ROOT \
  -e CCACHE_DIR=$BLADE_ROOT/.builder_ccache \
  -u $(id -u ${USER}):$(id -g ${USER}) \
  -v $BLADE_ROOT:$BLADE_ROOT \
  darkmatterstudio/blade-builder \
  /opt/run_blade_in_docker.sh $@
}
