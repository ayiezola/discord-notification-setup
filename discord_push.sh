#!/bin/bash

#Run as sudo user

# if [[ $EUID > 0 ]]; then
#   echo "Please run as root/sudo"
#   exit 1
# else
  sudo apt update
  sudo apt install -y jq

#Download discord.sh
  	cd ~
  	git clone https://github.com/ChaoticWeg/discord.sh.git discord
  	cd discord
  	touch .webhook
  	sleep 2
  	echo "======================================="
  	echo "Please paste your discord webhook key :"
  	echo "======================================="
  	
  	#add webhook key
  	read webhook
  	echo $webhook | tee .webhook
  	sleep 2
  	echo "Do you want to generate notification text? :"
  	echo "1) Generate "
  	echo "2) No "
  	read -p "Select an option [1-2]: " option
	case $option in
		1)
		echo "Your bot name? "
		read username
		echo "Notification title? "
		read title
		echo "Notification description? "
		read description
		# echo "Please put icon direct link (Must be .png)"
		# read icon
		touch discord-alert.sh
		echo "#!/bin/bash" >> discord-alert.sh
		echo "todiscord --username '$username' --title '$title' --description '$description' --timestamp" >> discord-alert.sh
		;;	
		2) 
		echo "Continue.."
		;;
	esac
#Create symbolic link
  sudo ln -s ~/discord/discord.sh /usr/local/bin/todiscord
  sudo chmod +x /usr/local/bin/todiscord

#test notification
  todiscord --text 'im works!!' 

