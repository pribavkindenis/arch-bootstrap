#!/bin/bash


source base.sh


# ----------------------------------------
# Packages to install
# ----------------------------------------


packages=( i3 polybar )


# ----------------------------------------
# Functions
# ----------------------------------------


function install_i3()
{
    section "Configure i3"
    function executable()
    {
	function install_packages()
	{
	    pikaur -S --needed "${packages[@]}"
	}
        exec_by_condition install_packages "Do you want to install required packages? Y/n"

	cp --force ./config/i3/.xinitrc ~/
	
	mkdir -p ~/.config/i3    
	cp --force ./config/i3/config ~/.config/i3/

	mkdir -p ~/.config/polybar
	cp --force ./config/polybar/config ~/.config/polybar/
	cp --force ./config/polybar/launch.sh ~/.config/polybar/
    }
    exec_by_condition executable "Do you want to configure i3wm? Y/n"
}


# ----------------------------------------
# Main
# ----------------------------------------

install_i3
exit 0
