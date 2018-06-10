# PhotoResizer
Mass photo-resizing, signing and post-processing scripts for Linux

## REQUIREMENTS
This tool requires only ImageMagick to be installed in your *nix distro.
Check which of their packages provides the 'convert' tool, or install ImageMagick from source.
For some postprocess scripts, GIMP is also used.

No additional steps are required to use the tool. It's just a bunch of preconfigured batch scripts which are based on convert and the GIMP tool.

If you find these scripts useful, please help by contributing to improve them or simply spread the word. The more people find these useful and help improve them, the better use they will have!

## INSTRUCTIONS

In order you should run the toolset like this:

1. optionally run autocrop.sh beforehand
2. run processphotos.sh and/or processphotos_nwm.sh
3. optionally run postprocess_autowhitebatch.sh

The usual use case scenario would be when you have a lot of photos to resize or add a watermark. I found that most programs that allow for this sort of feature are either hard to set up properly, are proprietary, or have the inconvenience of you always having to pre-setup what is usually a repetitive process. The purpose of having developed these scripts it's so there is a drop-in, "one-click" solution for processing photos in a standard fashion. If you love working on *nix systems like me, you'll find this more useful than fiddling around with complicated GUIs.


## TECHY STUFF

All the scripts are released under a GPL V3.0 license.
Up to this point, they've all been used for personal purposes, so code quality is perhaps too simple and below standard. You'll have to excuse my bad habits at indentation too.
Below follows a description of what each script in the toolset does.

=== autocrop.sh ===
- Usage: autocrop.sh <width> <height>
- Input: ./in/*.JPG
- Output: ./autocrop/

This script takes two arguments and applies cropping to all the pictures in the "in" folder. Very useful when you're working with pictures taken from a distance and at a high resolution with a centered object being the only important object in the picture. I take a lot of automotive photos, often having to take a lot of pictures over a short time at different focal distances, often with the wrong lens in hand.
After you're done autocropping the photos, choose the ones you want and put them back in the 'in' folder for processing.


=== processphotos.sh ===
- Usage: processphotos.sh
- Input: ./in/*.JPG
- Output: ./watermarked/

This script is most likely the one you will be using all the time. It takes all the photos from the input folder, resizes them with a Lanczos filter and smooths them out applying a certain blur factor. It then applies the watermark to all photos and puts them in the output folder.
To customize the size, input filter, and blur factor, just edit out the script and change the values defined at the head of the script.
To customize the watermark, put it in ./src/watermark.png or edit the script to change the path. The watermark must be in PNG format and supports transparency. Suppose you could use another format by customizing the script, but you would lose quality (in case of GIF) and the transparency capability.


=== processphotos_nwm.sh ===
- Usage: processphotos_nwm.sh
- Input: ./in/*.JPG
- Output: ./nonwatermarked/

Same as the processphotos.sh script, only it doesn't apply the watermark at the end of the process.
Photos processed by this script are put in a different output folder. This is so that you are able to produce two distinct sets of photos (watermarked and non-watermarked) from the same source, to provide to some third-party or to have a different sized store of the original photos.


=== postprocess_autowhitebatch.sh ===
- Usage: postprocess_autowhitebatch.sh
- Input: ./watermarked/*.JPG
- Output: (none)

This script is a particular case where ImageMagick is not used, but GIMP is used instead. It applies automatic white balance to all photos in the 'watermarked' directory. The reason for this script is to increase the contrast of the photos without burning them, for uploading to Facebook where the quality sometimes gets sketchy. Looking at photos on a monitor is very different from looking at them on a print, so I would avise against applying this to photos that are going to be printed.
