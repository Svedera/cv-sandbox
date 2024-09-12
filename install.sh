#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <package_name> <version>"
    exit 1
fi

PACKAGE_NAME=$1
VERSION=$2

# Install the specified package with the given version
pip3 install "$PACKAGE_NAME==$VERSION"

# Get the exact frozen version of the installed package
FROZEN_VERSION=$(pip3 freeze | grep "^$PACKAGE_NAME==")

# Create constraints.txt if it doesn't exist
CONSTRAINTS_FILE="constraints.txt"
touch $CONSTRAINTS_FILE

pip freeze > constraints.txt

echo "$FROZEN_VERSION added to $CONSTRAINTS_FILE."