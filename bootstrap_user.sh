#!/bin/bash

source base.sh

# ----------------------------------------
# Packages to install
# ----------------------------------------


required_packages=( 
    vim
    xorg
    xorg-xinit
    lshw
    ttf-dejavu
    nerd-fonts-fira-code
    konsole
    firefox
    tree
    htop
    scrot
    xclip
)
lol_packages=( 
    screenfetch
    sl
    lolcat
)

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
    function executable()
    {
	pikaur -S --needed "${packages[@]}"
    }
    exec_by_condition executable "Do you want to install packages? Y/n"
}

function install_bashrc()
{
    section "Copy dotfiles"
    cp ./config/bash/.bashrc ~/
    source ~/.bashrc
}

function install_scrot()
{
    section "Install scrot"
    if [[ ! -d "~/.local/bin" ]]; then
        mkdir -p ~/.local/bin
    fi
    cp ./config/scrot/* ~/.local/bin
}



# Main
# ----------------------------------------


greeting
install_pikaur
install_packages
install_bashrc
install_scrot
bash bs_git.sh
bash bs_i3.sh
farewell
exit 0
