#!/usr/bin/env fish


# set unique filename
set pdf_file (ps aux | grep zathura | grep -v grep | awk '{print $NF}')
set pdf_name (string replace -r '\.pdf$' '' $pdf_file)
set date (date +"%Y%m%d_%H%M%S")
# set save path variable, every reboot can clear the save file
set save_img_path /tmp/{$pdf_name}_{$date}.png
# -a: choose the specific screen scope
# -f: set the gnome-screenshot save path
gnome-screenshot -a -f $save_img_path
# auto open the file
feh $save_img_path

