# youtube-dl help

<https://youtube-dl.org/>
<https://github.com/ytdl-org/youtube-dl>


## Installation (Ubuntu)

- For youtube-dl to mix the best quality possible:

```
sudo apt install ffmpeg
```

- The program:

```
sudo -H pip3 install --upgrade youtube-dl
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
