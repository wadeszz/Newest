#!/bin/bash
set -e
yes | buildozer android debug
mkdir -p output
cp bin/*.apk output/
echo "✅ APK собрано. Смотри в папке output"
