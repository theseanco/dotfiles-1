# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Bobthefish theme configuration.
set -g theme_nerd_fonts yes # Enable nerd font support
set -g theme_display_date no
set -g theme_color_scheme dark

# Aliases
source $HOME/.config/fish/aliases.fish

# Abbreviations
source $HOME/.config/fish/abbr.fish

# Force tmux to start in utf8 https://github.com/wernight/powerline-web-fonts/issues/8
set -gx LANG "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"

set -gx EDITOR "vim"
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow --ignore-file '/home/ayo/.vimignore'"

set -gx PATH $PATH "$HOME/bin"

set -gx GEM_HOME "$HOME/.gems"
set -gx PATH $PATH "$HOME/.gems/bin"

set -gx PATH $PATH "/home/ayo/.yarn/bin"
set -gx PATH $PATH "/home/ayo/.nvm/versions/node/v12.6.0/bin/node"

set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx PATH $PATH "$ANDROID_HOME/emulator"
set -gx PATH $PATH "$ANDROID_HOME/tools"
set -gx PATH $PATH "$ANDROID_HOME/tools/bin"
set -gx PATH $PATH "$ANDROID_HOME/platform-tools"

set -gx JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64"

# Golang
set -gx PATH $PATH "/usr/local/go/bin"
set -gx PATH $PATH "$HOME/go/bin"
set -gx GOBIN "$HOME/go/bin"
set -gx GOPATH "$HOME/go"
set -gx GOROOT "/usr/local/go"
set -Ux GO111MODULE "on"

# Rust
set -gx PATH $PATH "$HOME/.cargo/bin"
set -gx PATH $PATH "$HOME/.cargo/env"
