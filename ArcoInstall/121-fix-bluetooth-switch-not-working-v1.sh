#!/bin/bash
set -e

##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo "#############################"
echo "SPECIALITIES"
echo "#############################"
echo "Adding the current user to the group rfkill :"
echo "In order to be able to switch blueberry on and off"
# https://github.com/linuxmint/blueberry/issues/75
sudo usermod  -a -G rfkill $USER
echo

echo "################################################################"
echo "###################    T H E   E N D      ######################"
echo "################################################################"
