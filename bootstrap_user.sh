#!/bin/bash

source base.sh

# ----------------------------------------
# Packages to install
# ----------------------------------------


required_packages=( )
lol_packages=( screenfetch )

packages=( 
    "${required_packages[@]}"
    "${lol_packages[@]}"
)


# ----------------------------------------
# Functions
# ----------------------------------------


function install_pikaur()
{
    section "Install Pikaur"
    function executable()
    {
	git clone https://aur.archlinux.org/pikaur.git
        cd pikaur
        makepkg -fsri
        cd ..
        rm -rf pikaur
    }
    exec_by_condition executable "Do you want to install Pikaur package manager? Y/n"
}

function install_packages()
{
    section "Install packages"
    pikaur -S --needed "${packages[@]}"
}


# ----------------------------------------
# Main
# ----------------------------------------


greeting
install_pikaur
install_packages
bash bs_git.sh
farewell
exit 0
