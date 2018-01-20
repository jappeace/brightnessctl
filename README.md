# brightnessctl
This shell project is designed to allow change of the
*/sys/class/backlight/&#42;/brightness* without being root.
This is usefull for keybinding.

# installation
Installation is mostly done by the small makescript I wrote. 
However setting this up for i3 and edditing the sudoers file
needs to be done manually.

    sudo make install

## Make sudo not ask for a password
The script needs to be able to be run as root without sudo asking for a
password (otherwise you can't keybind it).

	$ sudo visudo

and insert the following line

	%wheel ALL=(root) NOPASSWD: /usr/local/bin/brightness

In my case the sudoers group is equal to wheel.

### Testing ###
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
