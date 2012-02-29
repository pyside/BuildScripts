#!/bin/sh

# To build a Debug release, make sure to have the debugging version
# of Python installed:
#export BUILD_TYPE=Debug
if [ -z "$BUILD_TYPE" ]; then
  export BUILD_TYPE=Release
fi

# Whenever to build Python 3 or Python 2 version:
#export PYSIDE_BUILDSCRIPTS_USE_PYTHON3=yes
if [ -z "$PYSIDE_BUILDSCRIPTS_USE_PYTHON3" ]; then
  export PYSIDE_BUILDSCRIPTS_USE_PYTHON3=no
fi



if [ "$PYSIDE_BUILDSCRIPTS_USE_PYTHON3" = "yes" ]; then
    # Get the Python version as "pythonx.y", e.g. "python2.6"
    PYTHONXY=`python3 -V 2>&1 | sed -e 's/Python \(3\.[0-9]*\).*/python\1/'`
    export PYSIDESANDBOXPATH=$HOME/pkg/pyside-sandbox-python3
else
    # Get the Python version as "pythonx.y", e.g. "python2.6"
    PYTHONXY=`python -V 2>&1 | sed -e 's/Python \(2\.[0-9]*\).*/python\1/'`
    export PYSIDESANDBOXPATH=$HOME/pkg/pyside-sandbox
fi

export PATH=$PYSIDESANDBOXPATH/bin:$PATH
export PYTHONPATH=$PYSIDESANDBOXPATH/lib/$PYTHONXY/site-packages:$PYSIDESANDBOXPATH/lib64/$PYTHONXY/site-packages:$PYTHONPATH
export LD_LIBRARY_PATH=$PYSIDESANDBOXPATH/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$PYSIDESANDBOXPATH/lib/pkgconfig:$PKG_CONFIG_PATH
export DYLD_LIBRARY_PATH=$PYSIDESANDBOXPATH/lib:$DYLD_LIBRARY_PATH

# If you want to use Qt Simulator, uncomment following line and set the
# enviroment variable $QT_SDK_HOME to the directory that contains the Qt
# tools for the Simulator platform (for example $HOME/qtsdk/Simulator/Qt/gcc/bin")

#Q_WS_SIMULATOR="yes"

# If you want to use Qt SDK, uncomment the following line, or set the
# environment variable $QT_SDK_HOME in something like your ~/.profile

#QT_SDK_HOME="$HOME/qtsdk/Desktop/Qt/474/gcc"

if [ "$QT_SDK_HOME" != "" ]; then
  export PATH=$QT_SDK_HOME/bin:$QT_SDK_HOME/qt/bin:$PATH
  export LD_LIBRARY_PATH=$QT_SDK_HOME/lib:$LD_LIBRARY_PATH
  export QTDIR=$QT_SDK_HOME:$QT_SDK_HOME/qt:$QTDIR
fi

