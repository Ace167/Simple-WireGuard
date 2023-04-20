#!/bin/bash

# Specify the configuration file to use -- Single .conf file use. Direcly starts up WireGuard.
# conf_file=/home/user_name/Desktop/WireGuardVPN/NL.conf

# sudo wg-quick up "$conf_file"

# Display a prompt to launch the VPN connection
# if zenity --question --title="Launch VPN Connection" --text="Do you want to launch the WireGuard VPN connection using $conf_file?"; then
#   sudo wg-quick up "$conf_file"
# fi

############ USE THIS SECTION WHEN YOU WANT TO SELECT FROM MULTIPLE .CONF FILES ###########################################

# Obtain a list of all configuration files
conf_files=$(ls /home/user_name/Desktop/WireGuardVPN/*.conf)
options=()

Add each filename to the options array
for file in $conf_files; do
   options+=($(basename "$file"))
done

# Display a list of configuration files and prompt the user to select one
selected=$(zenity --list --title="Select a configuration file to launch" --column="Configuration Files" "${options[@]}")

# If a configuration file was selected, launch the VPN connection
if [[ -n "$selected" ]]; then
sudo wg-quick up /home/user_name/Desktop/WireGuardVPN/"$selected"
fi

##########################################################END############################################################
