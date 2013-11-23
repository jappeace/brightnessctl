#brightnessctl
This shell project is designed to allow change of the */sys/class/backlight/&#42;/brightness* without being root.
This is usefull for keybinding.

#installation
for usage a couple of things need be done.
you should be root to make things faster:

	$sudo -i

##Cloning
I have the scripts located at /usr/local/lib/brightnessctl, there are refrences to this path in
*increase.sh* and *decrease.sh* if you want to install it somwhere else change the refences.

#Configuring
You should configure the path where your path is in *configure.sh*.
you propably also want to change the stepsize, since my screen allows about 5000 different brightnesses,
whereas a regular screen usaly allows about 100

##Permissions
First of all *decrease.sh*, *increase.sh* and *writebrightness.sh* need to be marked as executable on group level.
*increase.sh* and *decrease.sh* also need to be chowned to a group where the target user is also member off. The primary owner can remain root.

	#cd /usr/local/lib/brightnessctl
	#chmod 750 decrease.sh increase.sh writebrightness.sh
	#chown root:video increase.sh decrease.sh

##Global acces
Global access to the scripts is achieved by symlinking them from a folder defined in *$PATH* I used */usr/local/bin* since this directory
wass left empty by my packagemanager.

	#ln -s /usr/local/lib/brightnessctl/writebrightness.sh /usr/local/bin/brihgtness
	#ln -s /usr/local/lib/brightnessctl/increase.sh /usr/local/bin/brihgtness+
	#ln -s /usr/local/lib/brightnessctl/decrease.sh /usr/local/bin/brihgtness-

note that i rename them all

##The bridge
The key in this story is allowing the brightness command to be executed from a *sudo* without a passowrd
so edit the sudoers file:

	#visudo

and insert the following line

	%wheel ALL=(root) NOPASSWD: /usr/local/bin/brightness

In my case the sudoers group is equal to wheel.

##Testing
Go back to userspace

	#exit

Now type in (be warned, a brightness of 0 makes my screen completly black)

	$brightness 100
	$brightness 0

and the brightness should change.

##Key binding (i3)
If you use i3 you could use the following lines in your config to fix keybinding:

	bindsym $mod+F8 exec brightness-
	bindsym $mod+F9 exec brightness+
