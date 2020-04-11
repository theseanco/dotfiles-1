function ymp3
  youtube-dl --extract-audio --audio-format mp3 $argv
end

# Create a directory and change to it immediately
function mkcd
  mkdir $argv
  cd $argv
end

function vim
  ~/bin/./nvim.appimage $argv
end

function vi
  /usr/bin/vim $argv
end

function nvim
  ~/bin/./nvim.appimage $argv
end

# Return to the project root (where .git folder is)
function gcd
  cd (git rev-parse --show-toplevel)
end

function jekyll
  bundle exec jekyll $argv
end

# start tmux in UTF-8 mode
function tm
  tmux -u $argv
end

 # Flush DNS Cache
function flush-dns
  sudo /etc/init.d/networking force-reload
end

# Node
function n
  npm $argv
end

function y
  yarn --ignore-engines $argv
end

function go
  /usr/bin/go $argv
end

# Replace ls with lsd
function ls
  lsd $argv
end

# Replace cat with bat
function cat
  bat $argv
end
