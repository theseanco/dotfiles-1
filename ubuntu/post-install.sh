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
 apt install -y git fish gimp inkscape firefox chromium-browser vim mpv tlp htop
 wmctrl youtube-dl powertop tilix neofetch

  # Start TLP
  echo "Starting TLP"
  tlp start

  # Add PPAs
  echo "Adding Albert PPA"
  curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
  sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.10/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"

  echo "Adding Jumpapp PPA"
  add-apt-repository -y ppa:mkropat/ppa

  echo "Adding Lollypop PPA"
  add-apt-repository -y ppa:gnumdk/lollypop

  # Update and install from PPAs

  echo "Updating sources"
  apt update

  echo "Installing from PPAs"
  apt install -y albert jumpapp lollypop

  # Install Powerline fonts from Github
  echo "Installing powerline fonts"
  sudo -u $SUDO_USER git clone https://github.com/powerline/fonts
  cd fonts
  sudo -u $SUDO_USER ./install.sh
  cd ..
  sudo -u $SUDO_USER rm -rf fonts/

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
