#!/bin/bash

echo "Warning: This was not tested yet"

CURRENT_PATH=`pwd`

echo "Creating symbolic links to config files."
echo "Old config files are backed up."
[[ -f ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.tmux.conf_back
ln -s $CURRENT_PATH/.tmux.conf ~
[[ -f ~/.config/nvim ]] && mv ~/.config/nvim ~/.config/nvim_back
ln -s $CURRENT_PATH/nvim ~/.config/nvim
[[ -f ~/.config/home-manager/home.nix ]] && mv ~/.config/home-manager/home.nix ~/.config/home-manager/home.nix_back
ln -s $CURRENT_PATH/home.nix ~/.config/home-manager/
[[ -f ~/.config/git/config ]] && mv ~/.config/git/config ~/.config/git/config_back
ln -s $CURRENT_PATH/git_config ~/.config/git/config
[[ -f ~/.config/git/git-prompt.sh ]] && mv ~/.config/git/git-prompt.sh ~/.config/git/git-prompt.sh_back
ln -s $CURRENT_PATH/git-prompt.sh ~/.config/git/git-prompt.sh

rm -r ~/.fonts
mkdir -p ~/.fonts/
ln -s $CURRENT_PATH/fonts/Hack/*.ttf ~/.fonts/
fc-cache -fv

echo "Adding bashmarks"
mkdir -p ~/.local/bin
pushd ~/.local/bin
wget https://raw.githubusercontent.com/huyng/bashmarks/master/bashmarks.sh
popd

echo "Adding git configuration"
mkdir -p ~/.config/git/
pushd ~/.config/git
git clone https://github.com/unixorn/git-extra-commands.git
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
mv git-completion.bash completion.sh
popd

home-manager switch -b backup
