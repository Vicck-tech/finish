#!/bin/bash
# Finish Setup my ArcoLinux

##################################################################################################################
# # Aurthor     :Vicck-tech 
# 
# 
# 
##################################################################################################################

# Make sure each command executes properly
# Put the fancy bash promt back after updating
function settings() {
	echo
	cd /etc/skel/.config/gtk-3.0/
	sudo sed -i -e 's/gtk-theme-name=Arc-Dark/gtk-theme-name=Flat-Remix-GTK-Blue-Darker-Solid/g' /etc/skel/.config/gtk-3.0/settings.ini
	echo
	sudo sed -i -e 's/gtk-icon-theme-name=Sardi-Arc/gtk-icon-theme-name=Flat-Remix-Blue-Dark/g' /etc/skel/.config/gtk-3.0/settings.ini
	echo
	sudo sed -i -e 's/gtk-font-name=Noto Sans 11/gtk-font-name=Noto Sans 14/g' /etc/skel/.config/gtk-3.0/settings.ini
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

settings
leave