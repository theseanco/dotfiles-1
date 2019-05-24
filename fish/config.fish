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

function vi
  /usr/bin/vim $argv
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


# Git aliases

function ga
  git add $argv
end

function gA
  git add -A $argv
end

function gcma
  git commit --amend
end

function gnope
  git checkout . $argv
end

function unstage
  git unstage HEAD $argv
end

function gcm
  git commit $argv
end

function gs
  git status $argv
end

function gbh
  git branch $argv
end

function gch
  git checkout $argv
end

function nvim
  ~/Downloads/./nvim.appimage $argv
end

# Other

# Force tmux to start in utf8 https://github.com/wernight/powerline-web-fonts/issues/8
set -gx LANG "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"

function tm
  tmux -u $argv
end

function c
  cargo $argv
end

function pw
 upower -i /org/freedesktop/UPower/devices/battery_BAT0 $argv
end

# Flush DNS Cache
function flush-dns
  sudo /etc/init.d/networking force-reload
end

set -gx EDITOR "vim"
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --ignore-file '/home/ayo/.vimignore'"

set -gx GEM_HOME "$HOME/.gems"
set -gx GEM_PATH "$HOME/.gems/bin:$PATH"

set -gx PATH $PATH "/home/ayo/.yarn/bin"
set -gx PATH $PATH "/usr/local/go/bin"

set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx PATH $PATH "$ANDROID_HOME/emulator"
set -gx PATH $PATH "$ANDROID_HOME/tools"
set -gx PATH $PATH "$ANDROID_HOME/tools/bin"
set -gx PATH $PATH "$ANDROID_HOME/platform-tools"

set -gx JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64"
