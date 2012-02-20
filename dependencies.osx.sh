#!/bin/sh
# Install build dependencies for Mac OS X using Homebrew
# Get Homebrew from http://mxcl.github.com/homebrew/

if [ "`which brew`" == "" ]; then
  cat <<EOF

  The command "brew" was not found on your system. This
  script assumes that you have Homebrew installed. Would
  you like to open the Homebrew Installation page in your
  browser now?

EOF
  /bin/echo -n "(Y/n) "
  read yn
  if [ "$yn" == "" -o "$yn" == "y" -o "$yn" == "Y" ]; then
    url='https://github.com/mxcl/homebrew/wiki/installation'
    echo "Opening $url..."
    open "$url"
  fi
  echo "Please restart this script after installing Homebrew."
  exit 1
fi

echo "Updating homebrew cache..."
brew update

for dependency in cmake libxml2; do
    echo "Installing/upgrading dependency: $dependency"
    brew install $dependency || brew upgrade $dependency
done

