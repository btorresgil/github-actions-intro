#!/bin/sh

rm -rf dist
mkdir -p dist/reveal dist/images
cp ./*.html dist/
cp ./*.md dist/
cp -R images/* dist/images/
cp -R node_modules/reveal.js/* dist/reveal/
sed -i.bak -E "s/\/node_modules\/reveal.js\//reveal\//" "dist/index.html" && rm "dist/index.html.bak"