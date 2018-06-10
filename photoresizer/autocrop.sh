#!/bin/bash
ADIRNAME="autocrop"
FNAME='*.JPG'


CROP_X=$1
CROP_Y=$2
echo "Cropping all images in input at ${CROP_X} by ${CROP_Y}..."

for i in ./in/${FNAME}
#./in/*.jpg ./in/*.jpeg ./in/*.JPG ./in/*.JPEG
do
    echo "Processing $i..."
    if [ ! -d "./${ADIRNAME}" ]; then mkdir "./${ADIRNAME}"; fi
    filename=$(basename "$i")
    convert \
    "$i" \
    -gravity center \
    -crop "${CROP_X}x${CROP_Y}+0+0" \
    -resize "${CROP_X}x${CROP_Y}^" \
    "./${ADIRNAME}/$filename"
done

echo "Done!"
exit 0
