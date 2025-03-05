# environment variables
set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx
set -gx date (date)

# import all function files in folder: ./functions
for file in ~/.config/fish/functions/*.fish
    source $file
end

# remove fish shell greeting
set -U fish_greeting ""

# import all alias
source ~/.config/fish/aliases.fish
