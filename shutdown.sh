#!/bin/bash

conf_files=$(ls /home/user_name/Desktop/WireGuardVPN/*.conf)
options=()

for file in $conf_files; do
  options+=($(basename $file))
done

selected=$(zenity --list --title="Select a configuration file to shut down" --column="Configuration Files" "${options[@]}")

if [[ -n "$selected" ]]; then
  sudo wg-quick down /home/user_name/Desktop/WireGuardVPN/"$selected"
fi
