#!/bin/bash

source base.sh

# ----------------------------------------
# User to be created
# ----------------------------------------


user="neuron"


# ----------------------------------------
# Packages to install
# ----------------------------------------


packages=( base-devel git terminus-font )


# ----------------------------------------
# Functions
# ----------------------------------------


function install_packages()
{
    section "Install packages"
    pacman -S --needed "${packages[@]}"
}

function create_user()
{
    section "Create user"
    function executable()
    {
	useradd -m -g users -G wheel,lp,sys,network,power -s /bin/bash "${user}"
	echo "User '${user}' successfully created"
	passwd neuron
    }
    exec_by_condition executable "Do you want to create user '${user}'? Y/n"
}

function setup_sudoers()
{
    section "Setup sudoers"
    function executable()
    {
	cp --force ./config/sudo/10-sudoers /etc/sudoers.d/
    }
    exec_by_condition executable "Do you want to copy '10-sudoers' file to the '/etc/sudoers.d/'? Y/n"
}

function install_terminus_font()
{
    section "Terminus console font"
    setfont /usr/share/kbd/consolefonts/ter-918b.psf.gz
    echo -e "FONT=ter-918b\n" > /etc/vconsole.conf
    echo "Terminus font successfully installed"
}


# ----------------------------------------
# Main
# ----------------------------------------

greeting
install_packages
install_terminus_font
create_user
setup_sudoers
bash bs_git.sh
farewell
exit 0
