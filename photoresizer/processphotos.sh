#!/bin/bash
#ProcessPhotos v1.2 by ThunderFox
#
# CHANGELOG:
#	2016-06-19	v1.0		Initial Version
#	2016-07-17	v1.1		Added 'autocrop' feature
#	2016-12-04	v1.2		Added 'autowhitebatch' feature

RDIRNAME="resized"
WDIRNAME="watermarked"
WIDTH=1600
WATERMARK="src/watermark.png"
FNAME='*.JPG'
BLURLVL=0.5 #default 0.8

#echo "Making directory $RDIRNAME..."
#mkdir $RDIRNAME
#convert "${FNAME}[1200x>]" "$RDIRNAME/%03d_resized.jpg"
#echo "Watermarking pictures from file $WATERMARK, please wait..."
#mkdir $WDIRNAME
#composite -compose src-atop -gravity SouthEast -geometry +20 $WATERMARK "$RDIRNAME/*_resized.jpg" "$WDIRNAME/%03d_wmark.jpg"

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
    $WATERMARK -gravity SouthEast -geometry +30 -composite \
    "./${WDIRNAME}/$filename"
done

echo "Done!"
exit 0
