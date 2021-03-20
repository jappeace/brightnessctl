# brightnessctl
This shell project is designed to allow change of the
*/sys/class/backlight/&#42;/brightness* without being root.
This is usefull for keybinding.

## Configuration
By default, it is configured to use intel backlight, as present in [configuration.sh](https://github.com/jappeace/brightnessctl/blob/master/configuration.sh#L3)
```bash
brightFolder="/sys/class/backlight/intel_backlight/"
```
This path may not be present in every environment. So, to get the correct path, navigate to `/sys/class/backlight` and search for the file with name = `brightness`.
```bash
$ pwd
/sys/class/backlight

$ ls -ltr
lrwxrwxrwx 1 root root 0 Mar 20 14:20 radeon_bl0 -> ../../devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0/card0-LVDS-1/radeon_bl0

$ find .  -maxdepth 2 -name 'brightness' -type f -follow
./radeon_bl0/brightness
find: File system loop detected; ‘./radeon_bl0/subsystem’ is part of the same file system loop as ‘.’.
```

and update the value in `configuration.sh` before executing `sudo make install`.

```bash
brightFolder="/sys/class/backlight/radeon_bl0/"
```

## Installation
Installation is mostly done by the small makescript I wrote. 
However setting this up for i3 and edditing the sudoers file
needs to be done manually.

    $ sudo make install

## Make sudo not ask for a password
The script needs to be able to be run as root without sudo asking for a
password (otherwise you can't keybind it).

	$ sudo visudo

and insert the following line

	%wheel ALL=(root) NOPASSWD: /usr/local/bin/brightness

In my case the sudoers group is equal to wheel.

## Testing
```diff
! be warned, a brightness of 0 made my screen completly black in the passed, 
! use arrow up to get the 100 command again
```
Now type in (be warned, a brightness of 0 made my screen completly black in the
passed, use arrow up to get the 100 command again)

	$brightness 100
	$brightness 0

The birghtness should have chagned.
Now you can setup keybindings to this script for your favorite window manager!

## Key binding (i3)
If you use i3 you could use the following lines in your config to fix keybinding:

	bindsym $mod+F8 exec brightness-
	bindsym $mod+F9 exec brightness+
