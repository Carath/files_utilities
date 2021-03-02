# Linux settings list


## Needed

Activate AHCI in BIOS/UEFI menu to install Linux on an SSD.


## System font size

Go to System Settings > Font Selection > Text scaling factor := 1.4


## Packages to install

```sh
# Compilers and various dev things:
sudo apt install libc6-dev git cmake clang g++ gfortran

# Doc and debugging:
sudo apt install gdb valgrind manpages-dev glibc-doc cppman

# Graphic libraries:
sudo apt install freeglut3-dev libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libfreetype6-dev

# Other utilities:
sudo apt install bash-completion gparted screenfetch mediainfo glogg chntpw
```

To check on the list of all installed packages:

``` dpkg --list ```

User selected ones:

```sh
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
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
sh -c "pactl set-sink-mute 0 false; pactl set-sink-volume 0 +2%"
```

> Volume-

```sh
sh -c "pactl set-sink-mute 0 false; pactl set-sink-volume 0 -2%"
```

Those have no balance issue anymore. Still, the 100% bug remains.

Note: on a laptop, one can use fn + S to take a screenshot.


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

/home/arthur/.steam/resource/styles
/home/arthur/.steam/steam


## Other things:

timedatectl set-local-rtc 1 // Tells your Ubuntu system that the hardware clock is set to 'local' time.

In wired network settings:
- Disable IPv6
- Use IPv4 custom DNS: 1.1.1.1

Install latest Nvidia graphic drivers.

// BUGGED (?)

// Getting rid of Num Lock crap:
sudo apt install numlockx // Allows to have Num Lock On on startup, after turning on the option in Login Window.
// create 2 startup commands with the following lines:
xmodmap -e 'keycode 77='
numlockx on


## Hardware/OS data

To know OS version, kernel number, ...

``` hostnamectl ```

To get CPU data:

``` vim /proc/cpuinfo ```

## Kerner management

Print installed kernels:

``` dpkg -l | grep linux-image | awk '{print$2}' ```

Purging an old kernel:

```sh
sudo apt remove --purge linux-image-4.4.0-21-generic
sudo update-grub2
sudo reboot
```


## Checking firewall status, and enabling/disabling

sudo ufw status verbose
sudo ufw enable
sudo ufw disable
