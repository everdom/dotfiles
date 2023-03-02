#!/bin/bash

sudo apt install -y build-essential vim zsh tmux git python-is-python3 curl wget net-tools python3-pip p7zip-full neofetch htop nnn ranger tmuxinator ripgrep adb cmake libtool libtool-bin libncurses5 python3-venv llvm xclip ctags global lldb librime libboost-all-dev libgoogle-glog-dev libleveldb-dev libmarisa-dev libopencc-dev libyaml-cpp-dev libgtest-dev ibus-rime screen meson bear
snap install btop
pip install youdao

# i3wm i3-gaps
sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
sudo apt install i3-gaps
sudo apt install feh compton xfce4-terminal i3lock-fancy
# polybar
sudo apt install cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev
mkdir -p ~/repo
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
# Optional. This will install the polybar executable in /usr/local/bin
sudo make install


# neovim
sudo apt-add-repository ppa:neovim-ppa/unstable
sudo apt install -y neovim

# set proxy to get packages below:
PROXY="http://127.0.0.1:7890"
echo set proxy to $PROXY
export http_proxy="$PROXY"
export https_proxy="$PROXY"

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# nvm
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.39.3/install.sh | bash
nvm install stable

# lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

