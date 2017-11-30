#!/bin/bash
# File: launch.sh
# Author: Mathieu Crilout <mathieucrilout@mail>
# Date: 30.11.2017

# This installation process has been thought for Arch linux distro but some parts can be apllied to another OS.
# pacaur
sudo pacman -Syu
sudo pacman -S pacaur git
cp dotfiles/.gitconfig ~/.
# linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
################################# VIM
mkdir .vim
# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# Solarized 
cp -R dotfiles/.vim/colors ~/.vim/colors
mkdir ~/.vim/pack
mkdir ~/.vim/pack/themes
mkdir ~/.vim/pack/themes/opt
git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8
# Bundles
git clone https://github.com/vim-scripts/AnsiEsc.vim ~/.vim/bundle/AnsiEsc.vim
git clone https://github.com/trotter/autojump.vim ~/.vim/bundle/autojump.vim
git clone https://github.com/docunext/closetag.vim ~/.vim/bundle/closetag.vim
git clone https://github.com/chrisbra/csv.vim ~/.vim/bundle/csv.vim
git clone https://github.com/kien/ctrlp.vim ~/.vim/bundle/ctrlp.vim
git clone https://github.com/zchee/deoplete-jedi ~/.vim/bundle/deoplete-jedi
git clone https://github.com/shougo/deoplete.nvim ~/.vim/bundle/deoplete.nvim
git clone https://github.com/bubujka/emmet-vim ~/.vim/bundle/emmet-vim
git clone https://github.com/othree/html5.vim ~/.vim/bundle/html5.vim
git clone https://github.com/tmhedberg/matchit ~/.vim/bundle/matchit
git clone https://github.com/neomake/neomake ~/.vim/bundle/neomake
git clone https://github.com/icymind/neosolarized ~/.vim/bundle/neosolarized
git clone https://github.com/c0r73x/neotags.nvim ~/.vim/bundle/neotags.nvim
git clone https://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree
git clone https://github.com/edkolev/promptline.vim ~/.vim/bundle/promptline.vim
git clone https://github.com/vim-python/python-syntax ~/.vim/bundle/python-syntax
git clone https://github.com/kien/rainbow_parentheses.vim ~/.vim/bundle/rainbow_parentheses.vim
git clone https://github.com/tmhedberg/simpylfold ~/.vim/bundle/simpylfold
git clone https://github.com/godlygeek/tabular ~/.vim/bundle/tabular
git clone https://github.com/edkolev/tmuxline.vim ~/.vim/bundle/tmuxline.vim
git clone https://github.com/sirver/ultisnips ~/.vim/bundle/ultisnips
git clone https://github.com/tpope/tpope-vim-abolish ~/.vim/bundle/tpope-vim-abolish
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
git clone https://github.com/gioele/vim-autoswap ~/.vim/bundle/vim-autoswap
git clone https://github.com/jeetsukumaran/vim-buffergator ~/.vim/bundle/vim-buffergator
git clone https://github.com/julienr/vim-cellmode ~/.vim/bundle/vim-cellmode
git clone https://github.com/mutewinter/vim-css3-syntax ~/.vim/bundle/vim-css3-syntax
git clone https://github.com/ap/vim-css-color ~/.vim/bundle/vim-css-color
pacaur -S nerd-fonts-complete # vim-devicons mandatory
git clone https://github.com/ryanoasis/vim-devicons ~/.vim/bundle/vim-devicons
git clone https://github.com/airblade/vim-gitgutter ~/.vim/bundle/vim-gitgutter
git clone https://github.com/alpertuna/vim-header ~/.vim/bundle/vim-header
git clone https://github.com/michaeljsmith/vim-indent-object ~/.vim/bundle/vim-indent-object
git clone https://github.com/pangloss/vim-javascript ~/.vim/bundle/vim-javascript
git clone https://github.com/leshill/vim-json ~/.vim/bundle/vim-json
git clone https://github.com/mxw/vim-jsx ~/.vim/bundle/vim-jsx
git clone https://github.com/tpope/vim-obsession ~/.vim/bundle/vim-obsession
git clone https://github.com/hynek/vim-python-pep8-indent ~/.vim/bundle/vim-python-pep8-indent
git clone https://github.com/kana/vim-repeat ~/.vim/bundle/vim-repeat
git clone https://github.com/fab-du/vim-sensible ~/.vim/bundle/vim-sensible
git clone https://github.com/anyakichi/vim-surround ~/.vim/bundle/vim-surround
git clone https://github.com/christoomey/vim-tmux-navigator ~/.vim/bundle/vim-tmux-navigator
git clone https://github.com/tmux-plugins/vim-tmux ~/.vim/bundle/vim-tmux
git clone https://github.com/tpope/vim-unimpaired ~/.vim/bundle/vim-unimpaired
git clone https://github.com/benmills/vimux ~/.vim/bundle/vimux
git clone https://github.com/nelstrom/vim-visual-star-search ~/.vim/bundle/vim-visual-star-search
git clone https://github.com/maxbrunsfeld/vim-yankstack ~/.vim/bundle/vim-yankstack
# vimrc
cp dotfiles/.vimrc ~/.vimrc
cp dotfiles/.shell_prompt.sh ~/.

######################### NEOVIM
sudo pacman -S neovim;
echo "    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc" > ~/.config/nvim/init.vim

######################### TERMITE
sudo pacman -S termite
cp dotfiles/.config/termite/config ~/.config/termite/config
echo "Choose termite as default terminal console."

######################### CONDA
sudo pacman -S python2 python3 jupyter-notebook ipython
pacaur -S python-conda
conda create -n python3 python=3.6 anaconda
conda install pytorch torchvision -c soumith
cp -R dotfiles/.ipython/profile_default ~/.ipython/.

######################### ZSH
sudo pacman -S autojump
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # oh-my-zsh
cp dotfiles/.zshrc ~/.

######################### TMUX
sudo pacman -S tmux
cp dotfiles/.tmuxline-colors.conf
cp dotfiles/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

######################### SSH
sudo pacman -S openssh
mkkir ~/.ssh
cp dotfiles/.ssh/id_rsa ~/.ssh/id_rsa
cp dotfiles/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub
cp dotfiles/.ssh/known_hosts ~/.ssh/known_hosts

######################### Various
sudo pacman -S libreoffice okular transmission vlc calibre deadbeef chromium pulseaudio xfce4-pulseaudio-plugin
pacaur -S franz
cp dotfiles/.ignore ~/.ignore

######################### Internet
sudo pacman -S networkmanager network-manager-applet

######################## Appearance
echo "APPEARANCE SETTINGS"
pacaur -S arc-gtk-theme
echo "Style -> Arc"
pacaur -S papirus-icon-theme-git
echo "Icons -> Papirus-Light"
pacaur -S otf-ibm-plex
echo "Fonts -> IBM Plex Sans Text 10"
echo "DESKTOP"
echo "Change the background at startup [Random Order]\nand copy google-map-wallpapers to /usr/shar/backgrounds/xfce"
echo "KEYBOARD"
echo "Change layout to English (programmer Dvorak)"
echo "PANEL"
echo "Mode: Horizontal\nLock panel [Checked]\nAutomatically hide the panel: Always\nRow Size:24\nNumber of rows:1\nLength:100\nStyle:Solid color\nAlpha:84\nColor:#000\nOpacity:100\nItems:Applications Menu>WindowButtons>Separator>Workspace Switcher>Clock>Notification Area>Action Buttons>PulseAudioPlugin"
echo "PREFERED APPLICATIONS"
echo "Chromium,Thunar,Termite"
echo "WINDOW MANAGER"
echo "Style:Arc\n\nKeyboard:Up>K,Down>J,Left>H,Right>L\nClose window>Shift+Ctrl+w\nMaximize window>Alt+m\nMove window to left workspace>Shift+Alt+A\nMove window to right workspace>Shift+Alt+S\nTile window to the top>Alt+K\nTile window to the bottom>Alt+J\nTile window to the left>Alt+H\nTile window to the right>Alt+L\nTile window to the top-left>Shift+Alt+K\nTile window to the top-right>Shift+Alt+L\nTile window to the bottom-left>Shift+Alt+H\nTile window to the bottom-right>Alt+J\nLeft workspace>Alt+A\nRight workspace>Alt+S"



