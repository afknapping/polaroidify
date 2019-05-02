#!/bin/bash

POLAROIDFEAME=~/src/imagemgick-tests/polaroid-frame.png

echo "$1"
CLEAN1=${1%/}
echo "$CLEAN1"



if [ ! -d "$1" ]; then
  echo "directory $1 does not exist"
  exit
fi

if [ ! -d "temp" ]; then
  mkdir temp
  echo "created temp"
fi
rm -f temp/*
echo "cleaned temp"

POLAROIDDIR="$CLEAN1-polaroids"
if [ ! -d "$POLAROIDDIR" ]; then
  mkdir $POLAROIDDIR
  echo "created $POLAROIDDIR"
fi
rm -f $POLAROIDDIR/*
echo "cleaned $POLAROIDDIR"


echo " "
for file in $CLEAN1/* ; do
  # echo "$file"
  EXIFDATE=$(identify -format '%[EXIF:DateTimeOriginal]' $file)
  EXIFARRAY=($EXIFDATE)
  TIMESTAMP="${EXIFARRAY//:/-}"
  FILENAMESTAMP="$TIMESTAMP"
  OUTPUTFILENAME="$FILENAMESTAMP--$(basename $file)"
  # echo "$OUTPUTFILENAME"

  magick $file -resize 1061x1060! -quality 100 temp/$(basename $file)
  if [ $? -eq 0 ]; then
    echo "OK read and converted $file"
  else
    echo "FAIL read and converted $file"
  fi

  composite temp/$(basename $file) -geometry +69+84 -compose Multiply -quality 100 $POLAROIDFEAME $POLAROIDDIR/$OUTPUTFILENAME
  if [ $? -eq 0 ]; then
    echo "OK wrote $POLAROIDDIR/$OUTPUTFILENAME"
  else
    echo "FAIL wrote $POLAROIDDIR/$OUTPUTFILENAME"
  fi


done


rm -rf temp
echo " "
echo "deleted temp"
echo " "
echo "The files are in $POLAROIDDIR"
echo " "

read -r -p "Open directory? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])
    open $POLAROIDDIR
 ;;
    [nN][oO]|[nN])
 echo "Ok then."
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac







# * [ImageMagick - Search](https://imagemagick.org/script/search.php?q=formatting+character&sa=)
# * [imagemagick Filename References - Google Search](https://www.google.com/search?hl=en&q=imagemagick%20Filename%20References)
# * [Filename References - using @ with filepath - ImageMagick](https://imagemagick.org/discourse-server/viewtopic.php?t=17830)
# * [output file name - ImageMagick](https://www.imagemagick.org/discourse-server/viewtopic.php?t=17149)
# * [new file name from source file name - ImageMagick](https://www.imagemagick.org/discourse-server/viewtopic.php?t=18272)
# * [File Handling -- IM v6 Examples](https://www.imagemagick.org/Usage/files/#save_escapes)
# * [bash for creation date - Google Search](https://www.google.com/search?hl=en&q=bash%20for%20creation%20date)
# * [linux - Get file modification time in a specific format (yyyymmddhh24miss) - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/285897/get-file-modification-time-in-a-specific-format-yyyymmddhh24miss)
# * [bash get filename from $i at DuckDuckGo](https://duckduckgo.com/?q=bash+get+filename+from+%24i&ia=web)
# * [Bash get basename of filename or directory name - nixCraft](https://www.cyberciti.biz/faq/bash-get-basename-of-filename-or-directory-name/)
# * [filenames - Bash extracting file basename from long path - Stack Overflow](https://stackoverflow.com/questions/18845814/bash-extracting-file-basename-from-long-path)
# * [cli exif data date at DuckDuckGo](https://duckduckgo.com/?q=cli+exif+data+date&ia=web)
# * [Managing the Exif Data on Your Photos From the Command-line [Linux]](https://www.maketecheasier.com/managing-exif-data-from-command-line/)
# * [Bash script to add exif metadata date only (not time) to photos without EXIF metadata from the directory they belong to - Stack Overflow](https://stackoverflow.com/questions/46924712/bash-script-to-add-exif-metadata-date-only-not-time-to-photos-without-exif-met)
# * [imagemagick get date from exif data - Google Search](https://www.google.com/search?hl=en&q=imagemagick%20get%20date%20from%20exif%20data)
# * [Extract EXIF data as text using ImageMagick - Stack Overflow](https://stackoverflow.com/questions/26654709/extract-exif-data-as-text-using-imagemagick)
# * [bash convert exif date to file at DuckDuckGo](https://duckduckgo.com/?q=bash+convert+exif+date+to+file&ia=web)
# * [Read EXIF data from JPEG file in bash script](https://www.experts-exchange.com/questions/24693599/Read-EXIF-data-from-JPEG-file-in-bash-script.html)
# * [find - Replacing all colons with dashes in a set of files? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/389103/replacing-all-colons-with-dashes-in-a-set-of-files)
# * [Bash Scripting Tutorial - Variables](https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php)
# * [How to split one string into multiple strings separated by at least one space in bash shell? - Stack Overflow](https://stackoverflow.com/questions/1469849/how-to-split-one-string-into-multiple-strings-separated-by-at-least-one-space-in)
# * [How to check if a command succeeded? - Ask Ubuntu](https://askubuntu.com/questions/29370/how-to-check-if-a-command-succeeded)
# * [Unix Create a Symbolic Link - nixCraft](https://www.cyberciti.biz/faq/unix-creating-symbolic-link-ln-command/)
# * [Get the source directory of a Bash script from within the script itself - Stack Overflow](https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself)
# * [bash - Remove slash from the end of a variable - Stack Overflow](https://stackoverflow.com/questions/1848415/remove-slash-from-the-end-of-a-variable)
# * [Bash Script - Prompt to Confirm (Y/N, YES/NO) - TecAdmin](https://tecadmin.net/bash-script-prompt-to-confirm-yes-no/)