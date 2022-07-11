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
sudo apt -qqy install gpg
sudo apt -qqy install thunar
sudo apt -qqy install rofi
sudo apt -qqy install feh
sudo apt -qqy install i3blocks
sudo apt -qqy install curl
sudo apt -qqy install wget
sudo apt -qqy install apt-transport-https
sudo apt -qqy install dirmngr
sudo apt -qqy install openssh-server
sudo apt -qqy install gcc
sudo apt -qqy install g++
sudo apt -qqy install default-jdk
sudo apt -qqy install i3
sudo apt -qqy install xorg
sudo apt -qqy install vim
sudo apt -qqy install tmux
sudo apt -qqy install lightdm
sudo apt -qqy install slick-greeter
sudo apt -qqy install i3lock
sudo apt -qqy install compton
sudo apt -qqy install scrot
sudo apt -qqy install imagemagick
sudo apt -qqy install snapd
sudo apt -qqy install neofetch
sudo apt -qqy install lxappearance
sudo apt -qqy install ffmpeg
sudo apt -qqy install obs-studio
sudo apt -qqy install pulseaudio
sudo apt -qqy install pavucontrol
sudo apt -qqy install python3-pip
sudo apt -qqy install gnome-screenshot
sudo apt -qqy install firmware-linux
sudo apt -qqy install firmware-linux-nonfree
sudo apt -qqy install evince
sudo apt -qqy install yarn
sudo apt -qqy install transmission-gtk
sudo apt -qqy install git
sudo apt -qqy install handbrake
sudo apt -qqy install nasm
sudo apt -qqy install adb
sudo apt -qqy install firefox-esr
sudo apt -qqy install vlc
sudo apt -qqy install qemu-kvm
sudo apt -qqy install libvirt-clients
sudo apt -qqy install libvirt-daemon-system
sudo apt -qqy install bridge-utils
sudo apt -qqy install virtinst
sudo apt -qqy install libvirt-daemon
sudo apt -qqy install virt-manager
sudo apt -qqy install rxvt-unicode
sudo apt -qqy install libdrm-dev
sudo apt -qqy install cmake
sudo apt -qqy install libqt5svg5
sudo apt -qqy install qml-module-qtquick-controls
sudo apt -qqy install qml-module-qtquick-controls2
sudo apt -qqy install qml-module-qtquick-controls
sudo apt -qqy install qml-module-qtquick-layouts
sudo apt -qqy install qml-module-qtcharts
sudo apt -qqy install qml-module-qt-labs-platform
sudo apt -qqy install libkf5archive5
sudo apt -qqy install extra-cmake-modules
sudo apt -qqy install libqt5quickcontrols2-5
sudo apt -qqy install qtdeclarative5-dev
sudo apt -qqy install libqt5charts5-dev
sudo apt -qqy install libqt5svg5-dev
sudo apt -qqy install qttools5-dev
sudo apt -qqy install qttools5-dev-tools
sudo apt -qqy install libkf5auth-dev
sudo apt -qqy install libkf5archive-dev
sudo apt -qqy install libbotan-2-dev
sudo apt -qqy install libbotan-2-doc
sudo apt -qqy install python3-botan
sudo apt -qqy install qtdeclarative5-dev
sudo apt -qqy install libqt5charts5-dev
sudo apt -qqy install libqt5svg5-dev
sudo apt -qqy install sysvinit-utils
sudo apt -qqy install hwdata
sudo apt -qqy install mesa-utils
sudo apt -qqy install util-linux

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
sudo apt -qqy install ./chrome.deb
sudo rm -f ./chrome.deb

# Install Sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt -qqy install sublime-text

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