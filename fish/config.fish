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

set -gx GEM_HOME "$HOME/.rvm/bin:$PATH"
set -gx GEM_HOME "$HOME/.gems"
set -gx PATH $PATH "$HOME/.gems/bin"

set -gx PATH $PATH "/home/ayo/.yarn/bin"

# Golang
set -gx PATH $PATH "/usr/local/go/bin"
set -gx PATH $PATH "$HOME/go/bin"
set -gx GOBIN "$HOME/go/bin"
set -gx GOPATH "$HOME/go"
set -gx GOROOT "/usr/lib/go"
set -Ux GO111MODULE "on"

# Snap
set -gx PATH $PATH "/var/lib/snapd/snap/bin"

# Rust
set -gx PATH $PATH "/home/ayo/.cargo/bin"
