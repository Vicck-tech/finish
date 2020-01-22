#!/bin/bash
# Finish Setup my ArcoLinux

##################################################################################################################
# # Aurthor     :Vicck-tech 
# 
# 
# 
##################################################################################################################

# Make sure each command executes properly
#bash -x test.sh 2>&1 | tee victory-log.txt
#exec &> ~/Documents/victory-log.txt

check_exit_status() {

	if [ $? -eq 0 ]
	then
		echo
		echo "Success"
		echo
	else
		echo
		echo "[ERROR] Update Failed! Check the errors and try again"
		echo
		
		read -p "The last command exited with an error. Exit script? (y/n) " answer

            if [ "$answer" == "y" ]
            then
                exit 1
            fi
	fi
}

function greeting() {

	echo
	echo "+-------------------------------------------------------------------------+"
	echo "|-- Hello, $USER. Let's Finish settting up your fresh ArcoLinux install.--|"
	echo "+-------------------------------------------------------------------------+"
	echo
	echo "This is not a silent install" 
	echo
	echo "you will be asked several questions as it progresses"
	sleep 5s
}

function arco() {
	echo
	echo "Running ArcoLinux Setup Scripts"
	echo
	sleep 3s
	cd /victory-finish/ArcoInstall/
	echo
	sh ArcoInstall/700-installing-fonts-v*.sh

}

function lightdm() {
	echo
	cd /etc/lightdm/
	sudo sed -i -e 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf
	echo
	sudo sed -i -e 's/webkit_theme        = antergos/webkit_theme        = litarvan/g' /etc/lightdm/lightdm-webkit2-greeter.conf
	echo

}

function leave() {

	echo
	echo "------------------------------------------------------------"
	echo "---- ArcoLinux-Victory Edition has finished installing! ----"
	echo "------------------------------------------------------------"
	echo
	echo "Enjoy"
	echo
	echo
	echo
	echo "Restarting in 15 Seconds"
	sleep 15s
	reboot
}

greeting
mirror
update
arch
arco
lightdm
leave