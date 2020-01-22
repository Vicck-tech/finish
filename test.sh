#!/bin/bash
# Finish Setup my ArcoLinux

##################################################################################################################
# # Aurthor     :Vicck-tech 
# 
# 
# 
##################################################################################################################

# Make sure each command executes properly
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
	echo "+-------------------------------------------------+"
	echo "|-- Hello, $USER. Let's install Victory Edition.--|"
	echo "+-------------------------------------------------+"
	echo
	echo "This is NOT a silent install" 
	echo
	echo "you will be asked some questions as it progresses"
	sleep 5s
}

# searching for the fastest mirrors
function mirror() {

	echo "Updating your Mirrors."
	sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist
#	check_exit_status
}

# Downloading and installing all Arch Linux and ArcoLinux packages
function update() {

	echo "Updating Arch & Arco."
	echo
	sleep 3s
	sudo pacman -Sy archlinux-keyring --noconfirm;
	sudo pacman -Syyu --noconfirm;
	check_exit_status
}

function arch() {
	echo
	echo "Running ArchLinux Setup Scripts"
	echo
	sleep 3s
	cd /victory/ArchWay/
	echo
	sh ArchWay/10-add-keyservers-for-key-importing-v*.sh
	sh ArchWay/20-trust-key-v*.sh
	sh ArchWay/30-add-arcolinux-repo-to-pacman-conf-v*.sh
	sh ArchWay/40-install-software-ArcoLinux-uses-in-bashrc-v*.sh
	sh ArchWay/50-create-autologin-group-to-be-able-to-autologin-v*.sh
	check_exit_status
}

function arco() {
	echo
	echo "Running ArcoLinux Setup Scripts"
	echo
	sleep 3s
	cd /victory/ArcoInstall/
	echo
	sh ArcoInstall/000-use-all-cores-makepkg-conf-v*.sh
	sh ArcoInstall/100-display-manager-and-desktop-v*.sh
	sh ArcoInstall/110-install-sound-v*.sh
	sh ArcoInstall/120-bluetooth-v*.sh
	sh ArcoInstall/121-fix-bluetooth-switch-not-working-v*.sh
	sh ArcoInstall/130-install-printers-v*.sh
	sh ArcoInstall/140-install-samba-v*.sh
	sh ArcoInstall/150-install-network-discovery-v*.sh
	sh ArcoInstall/200-software-arch-linux-repo-v*.sh
	sh ArcoInstall/300-software-AUR-repo-v*.sh
	sh ArcoInstall/400-software-arch-linux-repo-distro-specific-v*.sh
	sh ArcoInstall/500-software-AUR-repo-distro-specific-v*.sh
	sh ArcoInstall/600-software-from-ArcoLinux-repo-v*.sh
	sh ArcoInstall/700-installing-fonts-v*.sh
	check_exit_status
}

function lightdm() {
	echo
	cd /etc/lightdm/
	sudo sed -i -e 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf
	echo
	echo

}

function victory() {
	echo
	echo "Running ArcoLinux Victory Edition Setup Scripts"
	echo
	sleep 3s
	cd /victory/victoryInstall/
	echo
	sh VictoryInstall/100-software-from-victory-repo-v*.sh
	check_exit_status
}

function greeter() {
	echo
	cd /etc/lightdm/
	echo
	sudo sed -i -e 's/webkit_theme        = antergos/webkit_theme        = litarvan/g' /etc/lightdm/lightdm-webkit2-greeter.conf
	echo

}

function plank() {
	echo
	echo "Running Plank Config"
	echo
	sleep 3s
	install -dm 755 "$pkgdir"/etc/skel/.config/plank/dock1/launchers;
	cp -drf ~/victory/launchers --no-preserve='ownership' . "$pkgdir"/etc/skel/.config/plank/dock1/launchers/"$_pkgname"
	check_exit_status
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
victory
greeter
plank
leave