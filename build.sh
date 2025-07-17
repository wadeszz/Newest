#!/bin/bash
set -e
buildozer android debug
mkdir -p output
cp bin/*.apk output/
echo "✅ APK собрано. Смотри в папке /app/output"
