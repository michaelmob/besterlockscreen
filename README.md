# BESTerlockscreen
*A fork of [betterlockscreen](https://github.com/pavanjadhaw/betterlockscreen), originally by [pavanjadahaw](https://github.com/pavanjadhaw).*


## Screenshots

![scrot1](https://i.imgur.com/rsPD4Ke.jpg "scrot1.png")

![scrot2](https://i.imgur.com/mYmGG10.jpg "scrot2.png")


## In action

* [Demonstration](https://www.youtube.com/watch?v=9Ng5FZwnn6M&feature=youtu.be) - youtube.com


## Table of Contents

- **[Requirements](#requirements)**
    - [Dependencies](#dependencies)
- **[Installation](#installation)**
- **[Usage](#usage)**
- **[Desktop Background](#set-desktop-background-on-startup)**
- **[Keybinding](#keybindings)**
    - [i3wm](#i3wm-1)
    - [bspwm](#bspwm)
- **[Activate lockscreen when sleeping/suspending](#activate-lockscreen-when-sleepingsuspending-systemd-service)**



## Requirements

### Dependencies

- [i3lock-color](https://github.com/PandorasFox/i3lock-color)
	- i3lock fork with additional features( >= 2.11-c )
- [imagemagick](https://www.imagemagick.org/script/index.php)
	- To apply effects to images
- [xdpyinfo](https://www.x.org/archive/X11R7.7/doc/man/man1/xdpyinfo.1.xhtml), [xrandr](https://www.x.org/wiki/Projects/XRandR/), [bc](https://www.gnu.org/software/bc/) and [feh](https://feh.finalrewind.org/)
	- To find screen resolution, set custom blur level and wallpaper handling.



## Installation

```sh
git clone https://github.com/thetarkus/besterlockscreen
cd besterlockscreen
make install
```


## Usage

Run `besterlockscreen` and point it to a directory (`besterlockscreen -u "path/to/dir"`) or an image (`besterlockscreen -u "/path/to/img.jpg"`) and that's all. `besterlockscreen` will update its cache with the image you provide.

```sh
usage: besterlockscreen [-u "path/to/img.jpg"] [-l "dim, blur or dimblur"]
               [-w "dim, blur, or dimblur"] [-s "dim, blur or dimblur"]
               [-r "resolution"] [-b "factor"] [-t "custom text"] [-f "time format"]

besterlockscreen - the bester lockscreen.

Options:

        -h, --help
                For help (besterlockscreen -h or besterlockscreen --help).


        -u, --update
                to update image cache, you should do this before using any other options
                `besterlockscreen -u path/to/image.png` when image.png is custom background
                Or you can use besterlockscreen -u path/to/imagedir and a random file will be selected.
                Specify the default image path with the $LOCKSCREEN_IMAGE variable.


        -l, --lock
                to lock screen (besterlockscreen -l)
                you can also use dimmed or blurred background for lockscreen.
                `besterlockscreen -l dim` (for dimmed background)
                `besterlockscreen -l blur` (for blurred background)
                `besterlockscreen -l dimblur` (for dimmed + blurred background)
                Specify the default effect with the $LOCKSCREEN_EFFECT environment variable.


        -s, --suspend
                to suspend system and lock screen (besterlockscreen -s)
                you can also use dimmed or blurred background for lockscreen.
                `besterlockscreen -s dim` (for dimmed background)
                `besterlockscreen -s blur` (for blurred background)
                `besterlockscreen -s dimblur` (for dimmed + blurred background)


        -w, --wall
                you can also set lockscreen background as wallpaper
                to set wallpaper (besterlockscreen -w or besterlockscreen --wall)
                you can also use dimmed or blurred variants.
                `besterlockscreen -w dim` (for dimmed wallpaper)
                `besterlockscreen -w blur` (for blurred wallpaper)
                `besterlockscreen -w dimblur` (for dimmed + blurred wallpaper)


        -e, --effects
                to be used after -u
                select effects to generate; leave unset to generate all effects
                `besterlockscreen -e "blur,dim"`
                `besterlockscreen -e "dim"`


        -r, --resolution
                to be used after -u
                used to set a custom resolution for the image cache.
                `besterlockscreen -u path/to/image.png -r 1920x1080`
                `besterlockscreen -u path/to/image.png --resolution 3840x1080`


        -b, --blur
                to be used after -u
                used to set blur intensity. Default to 1.
                `besterlockscreen -u path/to/image.png -b 3`
                `besterlockscreen -u path/to/image.png --blur 0.5`


        -t, --text
                to set custom lockscreen text (max 31 chars)
                `besterlockscreen -l dim -t "Don't touch my machine!"`
                `besterlockscreen --text "Hi, user!" -s blur`
                Specify the default text with the $LOCKSCREEN_TEXT variable.


        -f, --time-format
                to set custom time format (max 31 chars)
                `besterlockscreen -l dim -t "Don't touch my machine!"`
                `besterlockscreen --text "Hi, user!" -s blur`
                Specify the default format with the $LOCKSCREEN_TIME_FORMAT variable.
```


### Examples
```sh
#
# Updating Image Cache
# ** Required before activating lockscreen **
#

# Generate image from filepath
besterlockscreen -u ~/Pictures/Bird.jpg

# Generate image from randomly selected file in path
besterlockscreen -u ~/Pictures

# Use environment variable as an alternative
export LOCKSCREEN_IMAGE="~/Pictures/Bird.jpg"
besterlockscreen -u

# Using a custom resolution and blur range
besterlockscreen -u ~/Pictures/Bird.jpg -r 2560x1440 -b 2


#
# Lockscreen
#

# Activate lockscreen without any effects
besterlockscreen -l

# Activate lockscreen with an effect
besterlockscreen -l [dim|blur|dimblur]


#
# Desktop Wallpaper
#

# Set desktop wallpaper without any effects
besterlockscreen -w

# Set desktop wallpaper with an effect
besterlockscreen -w [dim|blur|dimblur]
```



## Set desktop background on startup

```sh
.xinitrc

# set desktop background with custom effect
besterlockscreen -w dim

# Alternative (set last used background)
source ~/.fehbg
```


#### i3wm

```sh
~/.config/i3/config

# set desktop background with custom effect
exec --no-startup-id besterlockscreen -w dim

# Alternative (set last used background)
exec --no-startup-id source ~/.fehbg
```



## Keybindings


#### i3wm

```sh
~/.config/i3/config

bindsym $mod+shift+x exec besterlockscreen -l dim
```


#### bspwm

```sh
~/.config/sxhkd/sxhkdrc

# lockscreen
alt + shift + x
    besterlockscreen -l dim
```



## Activate lockscreen when sleeping/suspending (systemd service)

```sh
# Install using make
make install-service

# -- OR --

# enable systemd service
systemctl enable besterlockscreen@$USER

# disable systemd service
systemctl disable besterlockscreen@$USER


# Note: Now you can run `systemctl suspend` to suspend your system
# and besterlockscreen service will be activated.
```
