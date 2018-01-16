#!/usr/bin/env bash

do_serve() {
  echo 'starting service now!'
  jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token=''
}

if hash jupyter  2>/dev/null ; then
  do_serve
else
  echo 'install jupyter first!'
  conda install --yes jupyter
  do_serve
fi
