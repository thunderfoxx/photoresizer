#!/bin/bash
#ProcessPhotos v1.2 by ThunderFox (non-watermarked version)
#
# CHANGELOG:
#	2016-06-19	v1.0		Initial Version
#	2016-07-17	v1.1		Added 'autocrop' feature
#	2016-12-04	v1.2		Added 'autowhitebatch' feature

RDIRNAME="resized"
WDIRNAME="nonwatermarked"
WIDTH=1200
FNAME='*.JPG'
BLURLVL=0.5 #default 0.8

echo "Resizing all pictures to width $WIDTH..."

for i in ./in/${FNAME}
#./in/*.jpg ./in/*.jpeg ./in/*.JPG ./in/*.JPEG
do
    echo "Processing $i..."
    if [ ! -d "./${WDIRNAME}" ]; then mkdir "./${WDIRNAME}"; fi
    filename=$(basename "$i")
    convert \
    -filter Lanczos \
    "$i" \
    -set option:filter:filter Lanczos \
    -set option:filter:blur $BLURLVL \
    -resize $WIDTH \
    -quality 99 \
    "./${WDIRNAME}/$filename"
done

echo "Done!"
exit 0
