# NEEDED: activate AHCI in BIOS/UEFI menu.

# Some useful commands:

pwd // Print the working directory.

cd Documents // change the working directory to Documents.

cd - // goes back to previous working directory.
cd -- // goes further back.

ls // shows the folders and files in the working directory.

mkdir // create a folder.

> machin.txt // create a file.

// show disk space usage
df

// show all files in the current directory, along with their size in (bytes).
ls -al

// Creates 'filename' with 'content' inside, or append said content if it already exists. Append an ending '\n' !!!
echo "content" >> filename

// Same, but without the ending '\n'.
echo -n "content" >> filename


sudo service network-manager restart


gcc -Wall code_file.c -o executemoi // Compile the code_file.c file.
./executemoi // Run the compiled file.

gcc --version // version of gcc.

# System font size:
Go to System Settings > Font Selection > Text scaling factor := 1.4

# Install some C necessary files:
sudo apt-get install libc6-dev
sudo apt-get install freeglut3-dev

sudo apt-get install libsdl2-dev
sudo apt-get install libsdl2-image-dev
sudo apt-get install libsdl2-ttf-dev
sudo apt-get install libfreetype6-dev
sudo apt-get install manpages-dev glibc-doc
sudo apt-get install cppman

// Install a small bash screenshot information tool. Use it by typing 'screenfetch' in the console.
sudo apt install screenfetch

sudo apt-get install clang
sudo apt-get install cmake
sudo apt-get install g++
sudo apt-get install gfortran
sudo apt-get install git
sudo apt-get install gdb
sudo apt-get install valgrind
sudo apt-get install gparted

# Show user-installed packages:

comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)

# Custom shortcuts:

Volume+
amixer -D pulse sset Master unmute 2%+

Volume-
amixer -D pulse sset Master unmute 2%-

# Console transparency

// Disable console transparency: right click in console, preferences, colors

# Sublime Text

- install Package Control
- install Compare Side by Side


Go to: ```~/.config/sublime-text-3/Packages/User```

Update (create if necessary) the files:

The last preference must not have a comma after it.
All other preferences must have commas after them.

// Global settings:
-> Preferences.sublime-settings

```
{
	"color_scheme": "Packages/Color Scheme - Default/Monokai.sublime-color-scheme",
	"ignored_packages":
	[
		"Vintage"
	],
	"theme": "Default.sublime-theme",
	"font_size": 10,
	"ui_scale": 1.5,
	"shift_tab_unindent": true
}
// "highlight_modified_tabs": true,
// "enable_tab_scrolling": false,
// "preview_on_click": false,
```

> Keymap:
-> Default (Linux).sublime-keymap

```
[
	{ "keys": ["f1"], "command": "toggle_side_bar" },
	{ "keys": ["ctrl+space"], "command": "toggle_comment" },
	{ "keys": ["ctrl+tab"], "command": "next_view" },
	{ "keys": ["ctrl+shift+tab"], "command": "prev_view" },
	{ "keys": ["ctrl+t"], "command": "new_file"},
	{ "keys": ["ctrl+q"], "command": "unbound"},
	{ "keys": ["ctrl+g"], "command": "unbound" },
	{ "keys": ["ctrl++"], "command": "unbound" },
	{ "keys": ["ctrl+="], "command": "unbound" },
	{ "keys": ["ctrl+-"], "command": "unbound" }
]
// N.B: ctrl+t mirrors ctrl+n. Also, use ctrl+shift+t to reopen the last closed tabs.
```

> Mousemap:
-> Default (Linux).sublime-mousemap

```
[
	// Disable changing the font size with ctrl+scroll wheel:
	{ "button": "scroll_down", "modifiers": ["ctrl"], "command": "null" },
	{ "button": "scroll_up", "modifiers": ["ctrl"], "command": "null" }
]
```

# Firefox setting:

layout.css.devPixelsPerPx -> 1.4
dom.webnotifications.enabled -> false
full-screen-api.warning.timeout -> 300
general.smoothScroll.mouseWheel -> false // removes screen tearing in firefox.

// Firefox addons:

ublock Origin
Disable Tab Detach


# Steam install location:

/home/arthur/.steam/resource/styles
/home/arthur/.steam/steam

# Other things:

timedatectl set-local-rtc 1 // Tells your Ubuntu system that the hardware clock is set to 'local' time.

In wired network settings:
- Disable IPv6
- Use IPv4 custom DNS: 1.1.1.1


VLC -> X11 ouput.


Install latest Nvidia graphic drivers.

fn + S -> screenshot.

// BUGGED (?)

// Getting rid of Num Lock crap:
sudo apt-get install numlockx // Allows to have Num Lock On on startup, after turning on the option in Login Window.
// create 2 startup commands with the following lines:
xmodmap -e 'keycode 77='
numlockx on


// For vid files infos:
sudo apt-get install mediainfo

# Pre-installed text editors:

vi, vim, or nano.

# OS things

// To know OS version, kernel number, ...
hostnamectl

// To get CPU data:
vim /proc/cpuinfo

// Print installed kernels:
dpkg -l | grep linux-image | awk '{print$2}'

// Purging an old kernel:
sudo apt remove --purge linux-image-4.4.0-21-generic
sudo update-grub2
sudo reboot

# Checking firewall status, and enabling/disabling:

sudo ufw status verbose
sudo ufw enable
sudo ufw disable
