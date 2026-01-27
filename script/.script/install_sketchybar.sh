echo "Installing sketchybar dependencies"
# Packages
brew install lua
brew install switchaudio-osx
brew install nowplaying-cli

brew tap FelixKratz/formulae
brew install sketchybar

# SbarLua
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)

echo "Stowing sketchybar config"
stow ~/dotfiles/sketchybar/
brew services restart sketchybar
