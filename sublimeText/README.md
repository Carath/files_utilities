## Installation

Download manually the *.deb* file from <https://www.sublimetext.com/3>, or simply run:

```sh
wget https://download.sublimetext.com/sublime-text_build-3211_amd64.deb
```

Then run:

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
- TOML
- RemoteSubl

Go to: ``` ~/.config/sublime-text-3/Packages/User ```

Then place (overwrite if needed) the settings files (which are in json format) in this directory. Also, do the same thing for the root user in:

``` /root/.config/sublime-text-3/Packages/User ```

Shortcut to run the editor: ``` subl ```


## Disabling the update check and license upgrading pop-up

Simply append to the ``` /etc/hosts ``` file what follows, and restart Sublime Text:

```
# For Sublime Text
127.0.0.1 www.sublimetext.com
127.0.0.1 sublimetext.com
127.0.0.1 sublimehq.com
127.0.0.1 license.sublimehq.com
```


## Editing files over SSH

- Connect via SSH to the remote server with remote port forwarded, by running the command:
```sh
ssh -R 52698:localhost:52698 user@example.com
```

- On the remote server, install *rmate* (here the bash version - do this only once):

```sh
sudo curl -o /usr/local/bin/rmate https://raw.githubusercontent.com/aurora/rmate/master/rmate
sudo chmod +x /usr/local/bin/rmate
```

- Open Sublime Text on the local machine.
- On the remote server, run the command ``` rmate my_file.txt ```. The file should now be opened in Sublime Text and updated on save.


## Potential replacements

- ~~Atom~~
- ~~VSCodium~~
- CudaText
