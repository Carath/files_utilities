# youtube-dl help

<https://youtube-dl.org/>
<https://github.com/ytdl-org/youtube-dl>


## Installation (Ubuntu)

For youtube-dl to mix the best quality possible:

```sh
sudo apt-get install ffmpeg
```

For youtube-dl to be able to change mpeg4 metadata, e.g thumbnails:

```sh
sudo apt-get install atomicparsley
```

The program:

```sh
sudo -H pip3 install --upgrade youtube-dl
```

For installing the ``` yt-dlp ``` fork which enables to download age-restricted content, and isn't slow on youtube:

```sh
python3 -m virtualenv .venv
pip install curl_cffi
pip install "yt-dlp[default,curl-cffi]"
```

And to update it:

```sh
pip install -U yt-dlp
```

To impersonate a given browser:

```sh
. .venv/bin/activate
yt-dlp --list-impersonate-targets
yt-dlp --impersonate Chrome $TARGET
deactivate
clear_history
```


## youtube-dl usage

List all available versions:

```sh
youtube-dl -F https://www.youtube.com/watch?v=DM_OWuIvPeo
```

Download the best found version:

```sh
youtube-dl https://www.youtube.com/watch?v=DM_OWuIvPeo
```

Download the best version for a specific format (e.g mp4):

```sh
youtube-dl -f mp4 https://www.youtube.com/watch?v=DM_OWuIvPeo
```

Get only the audio part:

```sh
youtube-dl -x https://www.youtube.com/watch?v=DM_OWuIvPeo
```

Same, by choosing the format:

```sh
youtube-dl -x --audio-format mp3 https://www.youtube.com/watch?v=DM_OWuIvPeo
```

Audio only, with a thumbnail. This often requires to get the mp3 format:

```sh
youtube-dl -x --embed-thumbnail --audio-format mp3 https://www.youtube.com/watch?v=DM_OWuIvPeo
```

Getting 3 minutes of a video, starting from the first minute:

```sh
youtube-dl https://www.youtube.com/watch?v=DM_OWuIvPeo \
  --external-downloader ffmpeg --external-downloader-args "-ss 00:01:00.00 -t 00:03:00.00"
```

Dowloading age-restricted videos, using ``` yt-dlp ```:

```sh
yt-dlp https://www.youtube.com/watch?v=LmS9vcVNr5A
```

If the video name is too long (not the case here), use:

```sh
yt-dlp -o "%(id)s.%(ext)s" https://www.youtube.com/watch?v=DM_OWuIvPeo
```
