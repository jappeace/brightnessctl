INSTALL_FOLDER=/usr/local/lib/brightnessctl
install:
	echo installing
	mkdir -p $(INSTALL_FOLDER)
	cp -R ./*  $(INSTALL_FOLDER)/
	echo "export PATH=$$PATH:/usr/local/bin" > /etc/profile.d/brightness.sh
	ln -s $(INSTALL_FOLDER)/writebrightness.sh /usr/local/bin/brightness
	ln -s $(INSTALL_FOLDER)/increase.sh /usr/local/bin/brightness+
	ln -s $(INSTALL_FOLDER)/decrease.sh /usr/local/bin/brightness-
	echo "don't forget to modify your sudoers file and i3 config"

uninstall:
	echo uninstalling
	rm /etc/profile.d/brightness.sh
	rm -R $(INSTALL_FOLDER)
	rm /usr/local/bin/brightness
	rm /usr/local/bin/brightness+
	rm /usr/local/bin/brightness-
