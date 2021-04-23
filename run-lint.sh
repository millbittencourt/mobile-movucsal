#!/bin/bash

set -e

REPOSITORY_DIR=$(pwd)

cd "$REPOSITORY_DIR/"
flutter analyze lib
