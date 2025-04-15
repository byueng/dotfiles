# import environment variables
source ~/.config/fish/env_variables.fish

# import all function files in folder: ./functions
for file in ~/.config/fish/functions/*.fish
    source $file
end

# remove fish shell greeting
set -U fish_greeting ""

# import all alias
source ~/.config/fish/aliases.fish
