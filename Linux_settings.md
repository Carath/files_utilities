# Linux settings list


## Needed

Activate AHCI in BIOS/UEFI menu to install Linux on an SSD.


## System font size

Go to System Settings > Font Selection > Text scaling factor := 1.4


## Packages to install

```sh
# Compilers and various dev things:
sudo apt-get install libc6-dev git gitk cmake clang g++ gfortran

# Doc and debugging:
sudo apt-get install gdb valgrind manpages-dev glibc-doc cppman

# Graphic libraries:
sudo apt-get install freeglut3-dev libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libfreetype6-dev fonts-dejavu

# Other utilities:
sudo apt-get install bash-completion zip unzip unrar gparted screenfetch neofetch mediainfo htop glogg chntpw tree meld bat jq
```

Also, [Git LFS](https://git-lfs.github.com/) can be useful.

An alternative to mediainfo: ``` exiftool ```

To check on the list of all installed packages:

``` dpkg --list ```

User selected ones:

```sh
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
```

To check packages waiting to be upgraded (ignoring those in hold with apt-mark):

```sh
apt list --upgradeable
```

To check all available versions for a given package, e.g. here Firefox:

```sh
apt-cache madison firefox
```

To install a specific package version:

```sh
sudo apt-get install firefox=115.0+build2-0ubuntu0.20.04.3
```


## Startup

Enable redshift. See the redshift/ directory for a config file.


## Custom shortcuts

> Reassign System > Lock screen to Super + L

> VolumeMute

```sh
pactl set-sink-mute 0 toggle
```

> Volume+

```sh
sh -c "pactl set-sink-mute 0 false; pactl set-sink-volume 0 +3%"
```

> Volume-

```sh
sh -c "pactl set-sink-mute 0 false; pactl set-sink-volume 0 -3%"
```

Note: the last two commands need increments/decrements of at least 3%, since pactl (version 13.99.1) is bugged and prevents volumes of 98%, 99%, 101% and 102% to be ever reached, resulting in the volume being stuck to 100% !

N.B: on a laptop, one can use fn + S to take a screenshot.


## Console transparency

Disable console transparency: right click in console, preferences, colors.
Cursor shape: I-beam
Rows: 115, cols: 35


## Firefox:

See the firefox/ directory.


## Sublime Text

See the sublimeText/ directory.


## VLC

See in the vlc/ directory.


## Steam install location

``` /home/arthur/.steam/resource/styles ```
``` /home/arthur/.steam/steam ```


## Other things:

Tells your Ubuntu system that the hardware clock is set to 'local' time:

``` timedatectl set-local-rtc 1 ```

In wired network settings:
- Disable IPv6
- Use IPv4 custom DNS: 1.1.1.1

Install latest Nvidia graphic drivers.

<!-- Getting rid of Num Lock crap: [BUGGED?]
sudo apt-get install numlockx # Allows to have Num Lock On on startup, after turning on the option in Login Window.
create 2 startup commands with the following lines:
xmodmap -e 'keycode 77='
numlockx on -->


## Hardware/OS data

To know OS version, kernel number, etc: ``` hostnamectl ``` or ``` cat etc/os-release ```

To get CPU data: ``` vim /proc/cpuinfo ```


## Kernel management

Show the currently used kernel: ``` uname -r ```

Print all installed kernels:

``` dpkg -l | grep linux-image | awk '{print$2}' ```

Purging an old kernel:

```sh
sudo apt remove --purge linux-image-4.4.0-21-generic
sudo update-grub2
sudo reboot
```


## Checking firewall status, and enabling/disabling

```sh
sudo ufw status verbose
sudo ufw enable
sudo ufw disable
```


## youtube-dl

See the youtube-dl/ directory.


## Qalculate

See the qalculate/ directory.
