INSTALL_FOLDER=/usr/local/lib/brightnessctl
BIN_FOLDER=/usr/local/bin # works on most distros, nix needs sthng else
install:
	echo installing
	mkdir -p $(INSTALL_FOLDER)
	cp -R ./*  $(INSTALL_FOLDER)/
	ln -s $(INSTALL_FOLDER)/writebrightness.sh $(BIN_FOLDER)/brightness
	ln -s $(INSTALL_FOLDER)/increase.sh $(BIN_FOLDER)/brightness+
	ln -s $(INSTALL_FOLDER)/decrease.sh $(BIN_FOLDER)/brightness-
	echo "don't forget to modify your sudoers file and i3 config"

uninstall:
	echo uninstalling
	rm -R $(INSTALL_FOLDER)
	rm $(BIN_FOLDER)/brightness
	rm $(BIN_FOLDER)/brightness+
	rm $(BIN_FOLDER)/brightness-
