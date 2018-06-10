#!/bin/bash
cd watermarked
echo "Auto White Balance using GIMP on folder 'watermarked'..."
gimp -i -b '(batch-levels-stretch "*.JPG")' -b '(gimp-quit 0)'
echo "Done!"
exit 0
