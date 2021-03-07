#!/bin/bash

echo "Your bot name? "
read username
echo "Notification title? "
read title
echo "Notification description? "
read description
echo "Please put icon direct link (Must be .png)"
read -p "Icon (Press enter for default icon): " -e -i https://i.imgur.com/yGzyNtG.png icon
touch discord-alert.sh
echo "#!/bin/bash" >> discord-alert.sh
echo "todiscord --username '$username' --title '$title' --description '$description' --icon '$icon' --timestamp" >> discord-alert.sh