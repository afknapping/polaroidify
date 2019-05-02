# polaroidify.sh

polaroidify.sh creates polaroid-ish versions of square images.

⚠️ It expectes as argument a folder with source images in square format (they will come out distorted otherwise).

⚠️ It expects installed [imagemagick](https://www.imagemagick.org/) (if you're using brew you might be able to `brew install imagemagick`).

🏭 It creates a folder next to the folder with the originals with appended `-polaroids`.

🚀 It reads EXIF data and writes prepends the original filename with the creation date of the picture.


Example:
    
    ```
    git clone git@github.com:afknapping/polaroidify.sh.git polaroidify
    # given there is a folder with square source images called favs-190502
    polaroidify/polaroidify.sh favs-190502
    ```

Ideally, it would put out something like this:

```
created favs-190502-polaroids

OK read and converted favs-190502/445b989b-115a-47a2-8df9-4919f1ad89a9.jpg
OK wrote favs-190502-polaroids/2019-05-01--445b989b-115a-47a2-8df9-4919f1ad89a9.jpg
OK read and converted favs-190502/IMG_0149.jpg
OK wrote favs-190502-polaroids/2019-04-07--IMG_0149.jpg
OK read and converted favs-190502/IMG_0153.jpg
OK wrote favs-190502-polaroids/2019-04-07--IMG_0153.jpg

The files are in favs-190502-polaroids

Open directory? [Y/n]
```

If you answer with `y`, a Finder window will open, from which you can drag the files into any photo printing service.


