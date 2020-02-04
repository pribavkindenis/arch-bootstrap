#!/bin/bash

source base.sh

# ----------------------------------------
# User to be created
# ----------------------------------------


user="neuron"


# ----------------------------------------
# Packages to install
# ----------------------------------------


packages=( base-devel vi git terminus-font )


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

function edit_sudoers()
{
    section "Edit sudoers"
    function executable()
    {
	visudo
    }
    exec_by_condition executable "Do you want to edit sudoers file to allow wheel group use sudo? Y/n"
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
edit_sudoers
bash bs_git.sh
farewell
exit 0
