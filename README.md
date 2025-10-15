# zip2chd
Converts Zips to CHD files

## Requirements:

- mame-tools for `CHDMAN`

## What is a CHD:
CHD is a lossless compression format originally developed for MAME, for the hard-drive contents of certain arcade machines. It has since been used in several other emulators as a means of storing CD-ROM game data. For CD-based games, it compresses the contents of a disc image (.cue + .bin files) to a single .chd file, ontop of merging the files it uses file compression on the data tracks, and on the audio tracks transcodes them to FLAC to really save space. Advantages of CHD include single files for games, metadata embedding capacilities, smaller filesize.

## Repack 7zip archives to ZIP then delete 7zips

Instead of programming the logic to handle all this into the script lets let another program do the heavy lifting.

Install `atool`

`arepack -e -F zip *.7z ; rm -f *.7z`

This should work for RAR files too but I haven't tested this.

**I am not responsible for data loss! This script is provided AS IS and no warrenty is implied or offered.**

