#!/bin/bash


source base.sh


# ----------------------------------------
# Functions
# ----------------------------------------


function config_git_globally()
{
    section "Git first-time setup"
    function executable()
    {
	echo -n "Enter user name: "
	read name
	echo -n "Enter user email: "
	read email
	git config --global user.name "${name}"
	git config --global user.email "${email}"
	git config --global core.editor vim
    }
    exec_by_condition executable "Do you want to configure git? Y/n"
}

# ----------------------------------------
# Main
# ----------------------------------------

config_git_globally
exit 0
