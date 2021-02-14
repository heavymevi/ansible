#/bin/bash

for file in *.zip
do
  mv "$file" "${file%.*}.deb"
done
