## Installation

Download the .deb file from https://www.sublimetext.com/3, then run:

```sh
sudo dpkg -i sublime-text_build-3211_amd64.deb
```

Note: best version so far (stability + perfs): ``` 3.2.2 (Build 3211) ```. To prevent this version to be upgraded:

```sh
sudo apt-mark hold sublime-text
```


## Packages to install and settings

- Package Control
- Compare Side by Side
- Dockerfile Syntax Highlighting

Go to: ``` ~/.config/sublime-text-3/Packages/User ```

Then place (overwrite if needed) the settings files (which are in json format) in this directory. Also, do the same thing for the root user in:

``` /root/.config/sublime-text-3/Packages/User ```

Shortcut to run the editor: ``` subl ```


## Potential replacements

- ~~Atom~~
- ~~VSCodium~~
- CudaText
