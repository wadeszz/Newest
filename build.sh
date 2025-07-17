#!/bin/bash
set -e

cd project
yes | buildozer android debug

mkdir -p /app/output
cp bin/*.apk /app/output/
echo "✅ APK собрано. Файл доступен в папке /app/output"
