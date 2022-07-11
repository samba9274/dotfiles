#!/bin/bash

# Update sources.list
sudo tee /etc/apt/sources.list<<EOF
deb http://deb.debian.org/debian bullseye main contrib non-free
deb-src http://deb.debian.org/debian bullseye main contrib non-free
deb http://security.debian.org/debian-security bullseye-security main contrib non-free
deb-src http://security.debian.org/debian-security bullseye-security main contrib non-free
deb http://deb.debian.org/debian bullseye-updates main contrib non-free
deb-src http://deb.debian.org/debian bullseye-updates main contrib non-free
deb http://deb.debian.org/debian bullseye-backports main contrib non-free
deb-src http://deb.debian.org/debian bullseye-backports main contrib non-free
EOF

# Install apt packages
sudo apt update
sudo apt -qq install gpg
sudo apt -qq install thunar
sudo apt -qq install rofi
sudo apt -qq install feh
sudo apt -qq install i3blocks
sudo apt -qq install curl
sudo apt -qq install wget
sudo apt -qq install apt-transport-https
sudo apt -qq install dirmngr
sudo apt -qq install openssh-server
sudo apt -qq install gcc
sudo apt -qq install g++
sudo apt -qq install default-jdk
sudo apt -qq install i3
sudo apt -qq install xorg
sudo apt -qq install vim
sudo apt -qq install tmux
sudo apt -qq install lightdm
sudo apt -qq install slick-greeter
sudo apt -qq install i3lock
sudo apt -qq install compton
sudo apt -qq install scrot
sudo apt -qq install imagemagick
sudo apt -qq install snapd
sudo apt -qq install neofetch
sudo apt -qq install lxappearance
sudo apt -qq install ffmpeg
sudo apt -qq install obs-studio
sudo apt -qq install pulseaudio
sudo apt -qq install pavucontrol
sudo apt -qq install python3-pip
sudo apt -qq install gnome-screenshot
sudo apt -qq install firmware-linux
sudo apt -qq install firmware-linux-nonfree
sudo apt -qq install evince
sudo apt -qq install yarn
sudo apt -qq install transmission-gtk
sudo apt -qq install git
sudo apt -qq install handbrake
sudo apt -qq install nasm
sudo apt -qq install adb
sudo apt -qq install firefox-esr
sudo apt -qq install vlc
sudo apt -qq install qemu-kvm
sudo apt -qq install libvirt-clients
sudo apt -qq install libvirt-daemon-system
sudo apt -qq install bridge-utils
sudo apt -qq install virtinst
sudo apt -qq install libvirt-daemon
sudo apt -qq install virt-manager
sudo apt -qq install rxvt-unicode
sudo apt -qq install libdrm-dev
sudo apt -qq install cmake
sudo apt -qq install libqt5svg5
sudo apt -qq install qml-module-qtquick-controls
sudo apt -qq install qml-module-qtquick-controls2
sudo apt -qq install qml-module-qtquick-controls
sudo apt -qq install qml-module-qtquick-layouts
sudo apt -qq install qml-module-qtcharts
sudo apt -qq install qml-module-qt-labs-platform
sudo apt -qq install libkf5archive5
sudo apt -qq install extra-cmake-modules
sudo apt -qq install libqt5quickcontrols2-5
sudo apt -qq install qtdeclarative5-dev
sudo apt -qq install libqt5charts5-dev
sudo apt -qq install libqt5svg5-dev
sudo apt -qq install qttools5-dev
sudo apt -qq install qttools5-dev-tools
sudo apt -qq install libkf5auth-dev
sudo apt -qq install libkf5archive-dev
sudo apt -qq install libbotan-2-dev
sudo apt -qq install libbotan-2-doc
sudo apt -qq install python3-botan
sudo apt -qq install qtdeclarative5-dev
sudo apt -qq install libqt5charts5-dev
sudo apt -qq install libqt5svg5-dev
sudo apt -qq install sysvinit-utils
sudo apt -qq install hwdata
sudo apt -qq install mesa-utils
sudo apt -qq install util-linux

# Install snap packages
sudo snap install core
sudo snap install fast
sudo snap install eog
sudo snap install scrcpy
sudo snap install discord
sudo snap install postman

# Install Corectrl
cd ~/
git clone https://gitlab.com/corectrl/corectrl.git
cd corectrl
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF ..
make
sudo make install
cd ~/
sudo rm -rf corectrl

# Install Visual Studio Code
cd ~/
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code

# Install Chrome
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O chrome.deb
sudo apt -qq install ./chrome.deb
sudo rm -f ./chrome.deb

# Install Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt -qq install sublime-text

# Configure slick-greeter
sudo tee /etc/lightdm/slick-greeter.conf<<EOF
[Greeter]
background=$HOME/.config/lockscreen.jpg
draw-grid=false
EOF

# Link snap packages
sudo ln -s /var/lib/snapd/desktop/applications /usr/share/applications
echo "export PATH=\$PATH:/snap/bin">>~/.bashrc

# Copy dotfiles
cp -r ./dotfiles/.* ~/