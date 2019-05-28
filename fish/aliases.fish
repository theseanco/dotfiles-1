# Ubuntu
function apti
  sudo apt install $argv
end

function aptu
  sudo apt update $argv
end

function aptf
  sudo apt full-upgrade $argv
end

function aptr
  sudo apt remove $argv
end

function list-updates
  sudo apt list --upgradable
end

function add-repo
  sudo add-apt-repository $argv -y
end

function aptcl
  sudo apt autoremove
end

# Utilities
function ymp3
  youtube-dl --extract-audio --audio-format mp3 $argv
end

function mkcd
  mkdir $argv
  cd $argv
end

function vim
  nvim $argv
end

function vi
  /usr/bin/vim $argv
end

function gcd
  cd (git rev-parse --show-toplevel)
end

function jekyll
  bundle exec jekyll $argv
end

function nvim
  ~/Downloads/./nvim.appimage $argv
end

function tm # start tmux in UTF-8 mode
  tmux -u $argv
end

function pw # View power consumption
  upower -i /org/freedesktop/UPower/devices/battery_BAT0 $argv
end

function flush-dns # Flush DNS Cache
  sudo /etc/init.d/networking force-reload
end

# Node
function n
  npm $argv
end

function y
  yarn --ignore-engines $argv
end
