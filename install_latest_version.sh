#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./install_latest_version.sh <package_name>"
  exit 1
fi

PACKAGE_NAME=$1
VERSION=$(pipenv run python -m pip show $PACKAGE_NAME | grep Version | awk '{print $2}')
    
if [ -z "$VERSION" ]; then
  echo "Installing $PACKAGE_NAME..."
  pipenv install $PACKAGE_NAME
  VERSION=$(pipenv run python -m pip show $PACKAGE_NAME | grep Version | awk '{print $2}')
fi

echo "Installing $PACKAGE_NAME==$VERSION..."
pipenv install "$PACKAGE_NAME==$VERSION"