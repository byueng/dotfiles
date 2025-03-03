set -x GTK_IM_MODULE fcitx
set -x QT_IM_MODULE fcitx
set -x XMODIFIERS @im=fcitx

# import all function files in folder: ./functions
for file in ~/.config/fish/functions/*.fish
    source $file
end

# import all alias
source ~/.config/fish/aliases.fish
