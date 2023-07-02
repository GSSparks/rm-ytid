# rm-ytid Remove YouTube ID...
...from a filename or directory of filenames. `yt-dlp` adds the Youtube ID by default whenever you use it to download a video. This script will identify the files with an ID, show you how it intends to rename it, ask for verification that this is what you want, and then the remove the ID from the filename.
![Screenshot](media/screenshot.png?raw=true "Screenshot")
## Usage:
```
Usage: rm-ytid.sh [filepath]
  - If no filepath is provided, the script will run in the current directory.
  - If a filepath is provided, the script will operate on that specific file.
```
