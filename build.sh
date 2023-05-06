#!/bin/sh

echo Building...
docker build -t python3-alpine:numpy .

echo Test...
docker run --rm python3-alpine:numpy

