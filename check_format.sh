#!/bin/bash

expected_format="UTF-8"

files=$(find . -name "*.txt")
for file in $files; do
    actual_format=$(file -b --mime-encoding "$file")
    if [ "$actual_format" != "$expected_format" ]; then
        echo "Файл $file имеет неверный формат $actual_format (ожидается $expected_format)"
        exit 1
    fi
done
