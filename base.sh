#!/bin/bash

# ----------------------------------------
# Version
# ----------------------------------------


BOOTSTRAP_VERSION="v0.1"


# ----------------------------------------
# Colors
# ----------------------------------------


C_BLACK="\033[0;30m"
C_RED="\033[0;31m"
C_GREEN="\033[0;32m"
C_BROWN="\033[0;33m"
C_BLUE="\033[0;34m"
C_PURPLE="\033[0;35m"
C_CYAN="\033[0;36m"
C_L_GRAY="\033[0;37m"
C_D_GRAY="\033[1;30m"
C_L_RED="\033[1;31m"
C_L_GREEN="\033[1;32m"
C_YELLOW="\033[1;33m"
C_L_BLUE="\033[1;34m"
C_L_PURPLE="\033[1;35m"
C_L_CYAN="\033[1;36m"
C_WHITE="\033[1;37m"

C_DEFAULT="\033[0m"


# ----------------------------------------
# Functions
# ----------------------------------------


function greeting()
{
    echo -e "${C_L_GREEN}Welcome to the ${C_YELLOW}Arch Linux Bootstrap${C_L_GREEN} ${BOOTSTRAP_VERSION}${C_DEFAULT}"
    # sleep 1
}

function farewell()
{
    echo -e "${C_YELLOW}Bootstraping${C_L_GREEN} complete successfully!${C_DEFAULT}"
}

function write_border()
{
    for i in {1..42}
    do 
        echo -n '-'
    done
}

function section()
{
    if [[ -z $1 ]]
    then
        section_name="UNDEFINED"
    else
	section_name=$1
    fi

    echo -e "\n${C_L_GREEN}$(write_border) ${section_name} $(write_border)${C_DEFAULT}\n"
}

function exec_by_condition()
{
    if [[ -z "$1" || -z "$2" ]]
    then
	echo "${C_L_RED}Undefined params passed to 'exec_by_condition' decorator${C_DEFAULT}"
    else
	echo "$2"
	read answer
        if [[ "${answer}" == "Y" || "${answer}" == "y" ]]
        then
	    "$1"
        fi
    fi
}

