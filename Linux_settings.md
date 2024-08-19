# Linux settings list


## Beforehand

- Activate AHCI in BIOS/UEFI menu to install Linux on an SSD.
- Disable Windows Safe Boot (dual boot)
- Disable Windows Fast Startup (dual boot)


## Proxy setup

Add the following lines into the ``` ~/.bashrc ``` file:

```sh
export http_proxy="http://companyname:port"
export https_proxy="https://companyname:port"
export ftp_proxy="ftp://companyname:port"
```

Then source that file. Check the result with ``` env | grep -i proxy ```.

Also, create a ``` /etc/apt/apt.conf ``` file, containing the following:

```
// Proxy settings:
Acquire::http::Proxy "http://companyname:port";
Acquire::https::Proxy "https://companyname:port";
Acquire::ftp::proxy "ftp://companyname:port";
```

Also, the ``` sudo ``` command may need to be used with the ``` -E ``` option to take the proxy into account.


## System font size

[Linux Mint only] Go to System Settings > Font Selection > Text scaling factor := 1.4


## Packages to install

```sh
# Updating the packages list, and upgrading:
sudo -E apt-get update
sudo -E apt-get install --fix-broken # sometimes needed
sudo -E apt-get upgrade

# Necessary packages:
sudo -E apt-get -y install curl wget git make cmake automake libc6-dev python3-pip

# Basic editors:
sudo -E apt-get -y install vim vim-tiny nano

# Compilers, debugging and documentation:
sudo -E apt-get -y install gcc clang g++-12 gfortran gdb valgrind manpages-dev glibc-doc cppman

# Graphic libraries:
sudo -E apt-get -y install freeglut3-dev libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libfreetype6-dev fonts-dejavu

# Other utilities:
sudo -E apt-get -y install bash-completion gitk zip unzip unrar gparted \
  screenfetch neofetch mediainfo htop glogg chntpw tree meld bc bat jq \
  linux-tools-common linux-tools-generic ntfs-3g dconf-editor

# Video editing:
sudo -E apt-get -y install ffmpeg libavcodec-dev libavformat-dev atomicparsley
```

To install some preselected python3 packages, run:

```sh
pip3 install -r requirements.txt
```

Also grab a basic text editor like gedit, pluma, xed, or Leafpad.

Furthermore, [Git LFS](https://git-lfs.github.com/) can be useful.

An alternative to mediainfo: ``` exiftool ```

To check on the list of all installed packages:

```sh
dpkg --list
```

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
sudo apt-get -y install firefox=115.0+build2-0ubuntu0.20.04.3
```


## Startup

Enable redshift. See the ``` redshift/ ``` directory for a config file.


## Custom shortcuts

[Linux Mint] In ``` Keyboard > Shortcuts > System ```, reassign the *Lock screen* binding to *Super + L*

Additionally, in *Custom Shortcuts* add the following:

> VolumeMute

```sh
pactl set-sink-mute @DEFAULT_SINK@ toggle
```

> Volume-

```sh
sh -c "pactl set-sink-mute @DEFAULT_SINK@ false; pactl set-sink-volume @DEFAULT_SINK@ -3%"
```

> Volume+

```sh
sh -c "pactl set-sink-mute @DEFAULT_SINK@ false; pactl set-sink-volume @DEFAULT_SINK@ +3%"
```

Note: the last two commands need increments/decrements of at least 3%, since pactl (version 13.99.1) is bugged and prevents volumes of 98%, 99%, 101% and 102% to be ever reached, resulting in the volume being stuck to 100% !

N.B: on some laptops, one can use *fn + S* to take a screenshot.


## Desktop config export / import

This uses the ``` dconf-editor ``` package, and will work on Gnome based desktop environments (e.g Cinnamon).

To export a config, use:

```sh
dconf dump /org/cinnamon/ > desktop.dconf
```

To import a config, use:

```sh
dconf load /org/cinnamon/ < desktop.dconf
```

Example config files are present in the ``` cinnamon/ ``` directory for Cinnamon.


## Console settings

- Disable console transparency: right click in console, preferences, colors.
- Cursor shape: I-beam
- Rows: 115, cols: 35
- Add the CTRL+SHIFT+A shortcut to select all the console text.


## Cinnamon grouped windows

Cinnamon config - Grouped window list (missing in version 5.8.4):

- Right click on some grouped windows in the task bar ;
- Applet preferences > configure ;
- Reduce apps display duration to 200 ms.


## Firefox:

See the ``` firefox/ ``` directory.


## Sublime Text

See the ``` sublimeText/ ``` directory.


## VLC

See the ``` vlc/ ``` directory.


## youtube-dl

See the ``` youtube-dl/ ``` directory.


## Qalculate

See the ``` qalculate/ ``` directory.


## Steam install location

``` $HOME/.steam/resource/styles ``` and ``` $HOME/.steam/steam ```


## Other things:

Tells your Ubuntu system that the hardware clock is set to 'local' time:

``` timedatectl set-local-rtc 1 ```

In wired network settings:
- Disable IPv6
- Use IPv4 custom DNS: 1.1.1.1

Install latest Nvidia graphic drivers.


## Hardware / OS data

To know the OS version, kernel number, etc: ``` hostnamectl ```, ``` lsb_release -a ``` or ``` cat /etc/os-release ```

To get additional informations, use the installed ``` screenfetch ``` or ``` neofetch ``` commands.

To get CPU data: ``` cat /proc/cpuinfo ```


## Kernel management

Show the currently used kernel:

```sh
uname -r
```

Print all installed kernels:

```sh
dpkg -l | grep linux-image | awk '{print$2}'
```

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


## Finding the public IP address

```sh
curl ifconfig.me
```


## Monitoring the CPU frequency

```sh
cat /proc/cpuinfo | grep MHz
# or:
sudo inxi -C
```


## Printing the power options

```sh
grep . /sys/devices/system/cpu/cpu0/cpufreq/*
```


## Easy way to change the power options using cpupower

See [this link](https://wiki.archlinux.org/title/CPU_frequency_scaling#Scaling_governors) for more informations. Power options: *performance, powersave, userspace, ondemand, conservative, schedutil*.

N.B: *intel_pstate* and *amd_pstate* scaling driver may only provide the *powersave* and *performance* options, use *acpi_cpufreq* to have more choices.

```sh
sudo -E apt-get install linux-tools-common linux-tools-generic
sudo cpupower frequency-set --governor performance # or another setting
```


## Fixing the "Read-only file system" bug

For NTFS partitions (here ``` /dev/sda2 ```):

```sh
sudo -E apt-get install ntfs-3g
sudo umount /dev/sda2
sudo ntfsfix /dev/sda2
```

Then remount it again from the file explorer.
