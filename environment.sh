#!/bin/sh

export BUILD_TYPE=Release

# If you want to build a Debug release, make sure to have the
# debugging version of Python installed and uncomment this line:
#export BUILD_TYPE=Debug

export PYSIDESANDBOXPATH=$HOME/pkg/pyside-sandbox
export PATH=$PYSIDESANDBOXPATH/bin:$PATH
export PYTHONPATH=$PYSIDESANDBOXPATH/lib/python2.6/site-packages:$PYSIDESANDBOXPATH/lib64/python2.6/site-packages:$PYTHONPATH
export LD_LIBRARY_PATH=$PYSIDESANDBOXPATH/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$PYSIDESANDBOXPATH/lib/pkgconfig:$PKG_CONFIG_PATH
export DYLD_LIBRARY_PATH=$PYSIDESANDBOXPATH/lib:$DYLD_LIBRARY_PATH

# If you want to use Qt SDK, uncomment those lines:
#QT_SDK_HOME="$HOME/qtsdk-2010.05"
#export PATH=$QT_SDK_HOME/bin:$QT_SDK_HOME/qt/bin:$PATH
#export LD_LIBRARY_PATH=$QT_SDK_HOME/lib:$LD_LIBRARY_PATH
#export QTDIR=$QT_SDK_HOME/qt:$QTDIR

