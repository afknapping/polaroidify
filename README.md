# polaroidify.sh

polaroidify.sh creates polaroid-ish versions of square images.

The intention is to batch-process a folder of favourite images and then order cheap 9cm standard prints.

## Before/After


![IMG_0164](https://user-images.githubusercontent.com/170145/57106659-4a100d80-6d2e-11e9-81d4-6f4cdd428604.jpg) ➡️ ![2019-04-07--IMG_0164](https://user-images.githubusercontent.com/170145/57106660-4a100d80-6d2e-11e9-8a92-9399b9a0e296.jpg)

For ordering prints, you can for example use "Originalformt" at [fotoparadies.de](https://www.fotoparadies.de/fotos/fotoabzuege.html). 9cm is close enough to the original polaroid format... for me at least.

![order-polaroids](https://user-images.githubusercontent.com/170145/57108021-e2f45800-6d31-11e9-8449-efcdc0c3b668.jpeg)


---

⚠️ It expectes as argument a folder with source images in square format (they will come out distorted otherwise).

⚠️ It expects installed [imagemagick](https://www.imagemagick.org/) (if you're using brew you might be able to `brew install imagemagick`).

🏭 It creates a folder next to the folder with the originals with appended `-polaroids`.

🚀 It reads EXIF data and prepends the original filename with the creation date of the picture.

**So if you have a folder `favs-190502` where you exported your favourites into and in that a file `IMG_4592.jpg`, you will then have a folder `favs-190502-polaroids` and in it a file `19-04-14--IMG_4592.jpg` (where April 14 2019 would be the extracted date from the EXIF data).**

```

|
|`- favs-190502/IMG_4592.jpg
 `- favs-190502-polaroids/19-04-14--IMG_4592.jpg

```

---

Example:
    
    ```
    git clone git@github.com:afknapping/polaroidify.sh.git polaroidify
    # given there is a folder with square source images called favs-190502
    polaroidify/polaroidify.sh favs-190502
    ```

Ideally, it would put out something like this:

```
created favs-190502-polaroids

OK read and converted favs-190502/IMG_4592.jpg
OK wrote favs-190502-polaroids/2019-05-01--IMG_4592.jpg

The files are in favs-190502-polaroids

Open directory? [Y/n]
```

If you answer with `y`, a Finder window will open, from which you can drag the files into any photo printing service.

---

Sources:

* [ImageMagick - Search](https://imagemagick.org/script/search.php?q=formatting+character&sa=)
* [imagemagick Filename References - Google Search](https://www.google.com/search?hl=en&q=imagemagick%20Filename%20References)
* [Filename References - using @ with filepath - ImageMagick](https://imagemagick.org/discourse-server/viewtopic.php?t=17830)
* [output file name - ImageMagick](https://www.imagemagick.org/discourse-server/viewtopic.php?t=17149)
* [new file name from source file name - ImageMagick](https://www.imagemagick.org/discourse-server/viewtopic.php?t=18272)
* [File Handling -- IM v6 Examples](https://www.imagemagick.org/Usage/files/#save_escapes)
* [bash for creation date - Google Search](https://www.google.com/search?hl=en&q=bash%20for%20creation%20date)
* [linux - Get file modification time in a specific format (yyyymmddhh24miss) - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/285897/get-file-modification-time-in-a-specific-format-yyyymmddhh24miss)
* [bash get filename from $i at DuckDuckGo](https://duckduckgo.com/?q=bash+get+filename+from+%24i&ia=web)
* [Bash get basename of filename or directory name - nixCraft](https://www.cyberciti.biz/faq/bash-get-basename-of-filename-or-directory-name/)
* [filenames - Bash extracting file basename from long path - Stack Overflow](https://stackoverflow.com/questions/18845814/bash-extracting-file-basename-from-long-path)
* [cli exif data date at DuckDuckGo](https://duckduckgo.com/?q=cli+exif+data+date&ia=web)
* [Managing the Exif Data on Your Photos From the Command-line [Linux]](https://www.maketecheasier.com/managing-exif-data-from-command-line/)
* [Bash script to add exif metadata date only (not time) to photos without EXIF metadata from the directory they belong to - Stack Overflow](https://stackoverflow.com/questions/46924712/bash-script-to-add-exif-metadata-date-only-not-time-to-photos-without-exif-met)
* [imagemagick get date from exif data - Google Search](https://www.google.com/search?hl=en&q=imagemagick%20get%20date%20from%20exif%20data)
* [Extract EXIF data as text using ImageMagick - Stack Overflow](https://stackoverflow.com/questions/26654709/extract-exif-data-as-text-using-imagemagick)
* [bash convert exif date to file at DuckDuckGo](https://duckduckgo.com/?q=bash+convert+exif+date+to+file&ia=web)
* [Read EXIF data from JPEG file in bash script](https://www.experts-exchange.com/questions/24693599/Read-EXIF-data-from-JPEG-file-in-bash-script.html)
* [find - Replacing all colons with dashes in a set of files? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/389103/replacing-all-colons-with-dashes-in-a-set-of-files)
* [Bash Scripting Tutorial - Variables](https://ryanstutorials.net/bash-scripting-tutorial/bash-variables.php)
* [How to split one string into multiple strings separated by at least one space in bash shell? - Stack Overflow](https://stackoverflow.com/questions/1469849/how-to-split-one-string-into-multiple-strings-separated-by-at-least-one-space-in)
* [How to check if a command succeeded? - Ask Ubuntu](https://askubuntu.com/questions/29370/how-to-check-if-a-command-succeeded)
* [Unix Create a Symbolic Link - nixCraft](https://www.cyberciti.biz/faq/unix-creating-symbolic-link-ln-command/)
* [Get the source directory of a Bash script from within the script itself - Stack Overflow](https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself)
* [bash - Remove slash from the end of a variable - Stack Overflow](https://stackoverflow.com/questions/1848415/remove-slash-from-the-end-of-a-variable)
* [Bash Script - Prompt to Confirm (Y/N, YES/NO) - TecAdmin](https://tecadmin.net/bash-script-prompt-to-confirm-yes-no/)
