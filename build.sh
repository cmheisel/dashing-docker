#!/bin/bash

REGISTRY="cmheisel"
REPO="dashing"

build_and_register() {
    docker build -t "$REGISTRY/$REPO:$VERSION" .
    docker push "$REGISTRY/$REPO:$VERSION"
}

VERSION="1.1"
build_and_register
