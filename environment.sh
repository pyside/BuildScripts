#!/bin/sh

export PYSIDESANDBOXPATH=$HOME/pkg/pyside-sandbox/
export PATH=$PYSIDESANDBOXPATH/bin:$PATH
export PYTHONPATH=$PYSIDESANDBOXPATH/lib/python2.6/site-packages:$PYTHONPATH
export LD_LIBRARY_PATH=$PYSIDESANDBOXPATH/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$PYSIDESANDBOXPATH/lib/pkgconfig:$PKG_CONFIG_PATH
# set -DENABLE_ICECC=1 if you're using the icecream distributed compiler
alias runcmake='cmake .. -DCMAKE_INSTALL_PREFIX=$PYSIDESANDBOXPATH -DCMAKE_BUILD_TYPE=Debug -DENABLE_ICECC=0'

