#!/bin/sh

echo Building...
docker build -t python3-alpine .

echo Test...
docker run --rm python3-alpine

