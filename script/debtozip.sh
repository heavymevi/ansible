#/bin/bash

for file in *.deb
do
  mv "$file" "${file%.*}.zip"
done
