#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
else
#  sudo -u $SUDO_USER apt autoremove
  # Update and dist-upgrade
 # apt update && apt dist-upgrade -y

  # Install essentials from Ubuntu Repos
  echo "Installing packages from Ubuntu Repos"
 apt install -y git fish gimp shutter inkscape firefox chromium-browser vim mpv tlp htop wmctrl youtube-dl hexchat

  # Start TLP
  echo "Starting TLP"
  tlp start

  # Add PPAs

  echo "Adding Albert PPA"
  add-apt-repository -y ppa:nilarimogard/webupd8

  echo "Adding Tilix PPA"
  add-apt-repository -y ppa:webupd8team/terminix

  echo "Adding Elementary Tweaks PPA"
  add-apt-repository -y ppa:philip.scott/elementary-tweaks

  echo "Adding KDEConnect Indicator PPA"
  add-apt-repository -y ppa:webupd8team/indicator-kdeconnect

  echo "Adding Nitroshare PPA"
  apt-add-repository -y ppa:george-edison55/nitroshare

  echo "Adding Ghostwriter PPA"
  add-apt-repository -y ppa:wereturtle/ppa

  echo "Adding Jumpapp PPA"
  add-apt-repository -y ppa:mkropat/ppa

  echo "Adding Simple Screen Recorder PPA"
  add-apt-repository -y ppa:maarten-baert/simplescreenrecorder

  echo "Adding Lollypop PPA"
  add-apt-repository -y ppa:gnumdk/lollypop

  echo "Adding Neofetch PPA"
  add-apt-repository -y ppa:dawidd0811/neofetch

  # Update and install from PPAs

  echo "Updating sources"
  apt update

  echo "Installing from PPAs"
  apt install -y albert tilix elementary-tweaks kdeconnect indicator-kdeconnect ghostwriter nitroshare jumpapp simplescreenrecorder lollypop neofetch

  # Install custom icon sets

  # Install Papirus Icons from Github
  echo "Installing Papirus Icons"
  sudo -u $SUDO_USER wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-home.sh | sh

  # Install elementaryPlus Icons from Github
  echo "Installing elementaryPlus icons"
  sudo -u $SUDO_USER git clone https://github.com/mank319/elementaryPlus
  sudo -u $SUDO_USER mv elementaryPlus ~/.icons/

  # Install Powerline fonts from Github
  echo "Installing powerline fonts"
  sudo -u $SUDO_USER git clone https://github.com/powerline/fonts
  cd fonts
  sudo -u $SUDO_USER ./install.sh
  cd ..
  sudo -u $SUDO_USER rm -rf fonts/

  # Install elementary dropbox from Github
  echo "Installing elementary-dropbox from Github"
  sudo -u $SUDO_USER git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
  sudo -u $SUDO_USER bash /tmp/elementary-dropbox/install.sh -y

  # Install Ruby and Jekyll
  echo "Installing Ruby"
  apt install -y ruby ruby-dev make gcc
  echo "Installing Jekyll and Bundler"
  gem install jekyll bundler

  # Install Node Version Manager (NVM) and node
  echo "Installing NVM"
  sudo -u $SUDO_USER curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
  bash
  echo "Installing Node"
  nvm install node

  # Install Rust
  echo "Installing Rust"
  sudo -u $SUDO_USER curl https://sh.rustup.rs -sSf | sh

  # Install Exa (ls replacement)
  cargo install --no-default-features --git https://github.com/ogham/exa

  # Install Ubuntu Restricted Extras (Requires clicks)
  echo "Installing Ubuntu Restricted Extras"
  apt install -y ubuntu-restricted-extras

  # Uninstall apps
  echo "Uninstalling apps"

  # Cleaning up
  echo "Cleaning up"
  apt autoremove


  # prompt for a reboot
  clear
  echo ""
  echo "===================="
  echo " REBOOT YOUR COMPUTER! "
  echo "===================="
  echo ""
fi
