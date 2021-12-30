# youtube-dl help

<https://youtube-dl.org/>
<https://github.com/ytdl-org/youtube-dl>


## Installation (Ubuntu)

- For youtube-dl to mix the best quality possible:

```
sudo apt-get install ffmpeg
```

- For youtube-dl to be able to change mpeg4 metadata, e.g thumbnails:

```
sudo apt-get install atomicparsley
```

- The program:

```
sudo -H pip3 install --upgrade youtube-dl
```

- For installing the ``` yt-dlp ``` fork which enables to download age-restricted content:

```
python3 -m pip install -U yt-dlp
```


## Usage

- List all available versions:

```
youtube-dl -F https://www.youtube.com/watch?v=DM_OWuIvPeo
```

- Download the best found version:

```
youtube-dl https://www.youtube.com/watch?v=DM_OWuIvPeo
```

- Download the best version for a specific format (e.g mp4):

```
youtube-dl -f mp4 https://www.youtube.com/watch?v=DM_OWuIvPeo
```

- Get only the audio part:

```
youtube-dl -x https://www.youtube.com/watch?v=DM_OWuIvPeo
```

- Same, by choosing the format:

```
youtube-dl -x --audio-format mp3 https://www.youtube.com/watch?v=DM_OWuIvPeo
```

- Audio only, with a thumbnail. This often requires to get the mp3 format:

```
youtube-dl -x --embed-thumbnail --audio-format mp3 https://www.youtube.com/watch?v=DM_OWuIvPeo
```

- Getting 3 minutes of a video, starting from the first minute:

```
youtube-dl https://www.youtube.com/watch?v=DM_OWuIvPeo --external-downloader ffmpeg --external-downloader-args "-ss 00:01:00.00 -t 00:03:00.00"
```

- Dowloading age-restricted videos, using ``` yt-dlp ```:

```
yt-dlp https://www.youtube.com/watch?v=LmS9vcVNr5A
```
