install:
	sudo cp ./besterlockscreen /usr/local/bin/
	sudo cp ./besterlockscreen@.service /etc/systemd/system/
	echo 'Run "make install-service" to install the systemd service.'

uninstall:
	sudo rm /usr/local/bin/besterlockscreen
	sudo rm /etc/systemd/system/besterlockscreen@.service
	make uninstall-service

install-service:
	systemctl enable besterlockscreen@${USER}

uninstall-service:
	systemctl disable besterlockscreen@${USER}
