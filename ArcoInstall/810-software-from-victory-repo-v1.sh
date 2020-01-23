#!/bin/bash
#set -e

##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

echo "#######################################################"
echo "####                VICTORY                        ####"
echo "#######################################################"
echo

sudo pacman -S timeshift-autosnap --noconfirm --needed
sudo pacman -S victory-flat-remix-icons-git --noconfirm --needed
sudo pacman -S victory-update-git --noconfirm --needed
sudo pacman -S lightdm-webkit2-greeter --noconfirm --needed
sudo pacman -S victory-flat-remix-themes-git --noconfirm --needed
sudo pacman -S victory-lightdm-litarvan-git --noconfirm --needed
sudo pacman -S victory-plank-git --noconfirm --needed
sudo pacman -S victory-wallpaper-git --noconfirm --needed
sudo pacman -S hefftor-gimp-git --noconfirm --needed
sudo pacman -S hefftor-variety-git --noconfirm --needed

