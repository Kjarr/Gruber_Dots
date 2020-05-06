#!/bin/bash

#    Define Colours

RED='\033[1;31m'
LBLUE='\33[0;34m'
LGREE='\33[0;32m'
LGREEBOLD='\33[1;32m'
NC='\033[0m' # No Color
FLASH='\033[5m' 

# SET BASH COLOUR
clear
echo
echo
printf "${LGREE} >>> Hans Gruber v1.0 - Shaun Keir 2016\n"
printf "${LGREE} >>> Nothing special. Just a little bash script\n"
printf "${LGREE} >>> to download some settings for my i3 desktop\n ${NC}"
echo
printf "${RED}${FLASH} ***********************\n${NC}"
printf "${RED}${FLASH} ****** IMPORTANT ******\n${NC}"
printf "${RED}${FLASH} ***********************\n${NC}"
echo
printf "${RED} This script will install items from the official Arch Repository and the AUR.\n${NC}"
printf "${RED} Software installed from these repositories are not maintained or verified by me. \n${NC}"
printf "${RED} Please consult the readme for a list of software being installed. \n${NC}"
echo
printf "${LGREEBOLD} Continuing to use this script is your acceptance of responsibility.\n ${NC}"
echo
read -n 1 -s -r -p " Press any key to continue or CTRL-C to escape."
echo
echo
echo
echo
####################
# INSTALL COMMANDS #
####################
printf "${LBLUE} STARTING INSTALL...\n ${NC}"
echo
mkdir /home/$USER/Kjarr/
sleep 1
echo "This is file is for testing folder creation has worked. It can be deleted." > /home/$USER/Kjarr/Folder---OK
cd /home/$USER/Kjarr/
ls
PUBLIC_IP=` wget http://ipecho.net/plain -O - -q ; echo`
echo "Checking connection--- IP is: $PUBLIC_IP"
sleep 3
echo
sleep 1
printf "${LBLUE} INSTALLING FILE TOOLS (ZIP/TAR Etc.)...\n ${NC}"
sleep 1
printf "${LBLUE}INSTALLING REQS. (i3Status/ROFI/Dunst etc.)...\n ${NC}"
sleep 1
printf "${LBLUE}INSTALLING AESTHETICS (Feh/LXAppearance/Unclutter Etc.)...\n ${NC}"
sleep 1
printf "${LBLUE}DOWNLOADING DOTFILES (i3/Config Etc.)...\n ${NC}"
sleep 1
printf "${LBLUE}UNZIPPING DOTFILES...\n ${NC}"
sleep 1
printf "${LBLUE}POSITIONING DOTFILES...\n ${NC}"
sleep 1
printf "${LBLUE}SETTING PERMS ON SCRIPTS (ROFI Dialogues Etc.)...\n ${NC}"
echo
###########################
# END OF INSTALL COMMANDS #
###########################

echo "You have been Grubered! You can now delete the NewTheologian folder" > /home/$USER/Gruber.txt

#Exit if the script is already running, just in case
#Got this part of script somewhere in this forum
if pidof -x $(basename $0) > /dev/null; then
  for p in $(pidof -x $(basename $0)); do
    if [ $p -ne $$ ]; then
      echo "Script $0 is already running: exiting"
      exit
    fi
  done
fi

### DO NOT EDIT BELOW THIS LINE ###
### ANIM INSPIRED BY DANIEL KNIGHT - DIETPI ###
{


  INPUT=0
  if [[ $1 =~ ^-?[0-9]+$ ]]; then
    INPUT=$1
  fi

  #/////////////////////////////////////////////////////////////////////////////////////
  #Anim_0 processing
  #/////////////////////////////////////////////////////////////////////////////////////

  Anim_0(){

    local MAX_COUNT=28
    ((MAX_COUNT--))

    local count=0
    local mode=0
    local MAX_PASSES=2

    local passes=0

    local marker=(

      '* http://kjarr.co.uk | Rice & Pea Installed *'
      '---------------------------------------------'
      '=-------------------------------------------='
      '-=-----------------------------------------=-'
      '--=---------------------------------------=--'
      '---=-------------------------------------=---'
      '----=-----------------------------------=----'
      '-----=---------------------------------=-----'
      '------=-------------------------------=------'
      '-------=-----------------------------=-------'
      '--------=---------------------------=--------'
      '---------=-------------------------=---------'
      '----------=-----------------------=----------'
      '-----------=---------------------=-----------'
      '------------=-------------------=------------'
      '-------------=-----------------=-------------'
      '--------------=---------------=--------------'
      '---------------=-------------=---------------'
      '----------------=-----------=----------------'
      '-----------------=---------=-----------------'
      '------------------=-------=------------------'
      '-------------------=-----=-------------------'
      '--------------------=---=--------------------'
      '---------------------=-=---------------------'
      '----------------------=----------------------'

    )

    while (( $passes < $MAX_PASSES ))
    do
      if (( $mode == 0 )); then
        ((count++))
        if (( $count >= $MAX_COUNT )); then
          count=$MAX_COUNT
          mode=1
          ((passes++))
        fi
      elif (( $mode == 1 )); then
        ((count--))
        if (( $count <= 0 )); then
          count=0
          mode=0
          ((passes++))
        fi
      fi

      #color=$((228 + $count))
      color=154

      #echo -ne "${marker[$count]}\r"

      echo -ne "\e[33;${color}m ${marker[$count]}\r"
      #echo -e "\e[38;5;${color}m ${marker[$count]}\r"

      #echo -e "\e[38;5;154m ${marker[$count]}\r"

      #fSleep="0.0$count"
      local fSleep=0.03
      sleep "$fSleep"

    done

    unset marker

  }

   #/////////////////////////////////////////////////////////////////////////////////////
  #Main Loop
  #/////////////////////////////////////////////////////////////////////////////////////
  #----------------------------------------------------------------
  #Hide cursor
  tput civis
  #----------------------------------------------------------------
  # Run
  Anim_"$INPUT"
  #----------------------------------------------------------------
  #Put colours back to normal
  echo -e "\e[0m"

  #Move a line down
  echo -e ""
  #----------------------------------------------------------------
  #enable cursor
  tput cnorm
  #-----------------------------------------------------------------------------------
  exit
  #-----------------------------------------------------------------------------------
}
