# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Aliases

function ymp3
  youtube-dl --extract-audio --audio-format mp3 $argv
end

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

function dd
  dd status=progress
end

function add-repo
  sudo add-apt-repository $argv -y
end

function cleanup
  sudo apt autoremove
end

function mkcd
  mkdir $argv
  cd $argv
end

function unstage
  git reset HEAD $argv
end

function n
  npm $argv
end

function vim
  nvim $argv
end

function gcd
  cd (git rev-parse --show-toplevel)
end

function y
  yarn --ignore-engines $argv
end

function jekyll
  bundle exec jekyll $argv
end

function ga
  git add $argv
end

function gc
  git commit $argv
end

function gcm
  git commit -m $argv
end

function gs
  git status $argv
end

function gbd
  git branch -d $argv
end

# Fix for `npm` global commands not working in fish
# https://github.com/fish-shell/fish-shell/issues/3023
set PATH /home/ayo/.nvm/versions/node/v10.4.1/bin $PATH
