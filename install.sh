#!/bin/bash

echo "Warning: This was not tested yet"

CURRENT_PATH=`pwd`

echo "Installing must have utilities"
sudo apt install git vim tmux cowsay fortune-mod cmake

echo "Creating symbolic links to config files."
echo "Old config files are backed up."
[[ -f ~/.bashrc ]] && mv ~/.bashrc ~/.bashrc_back
ln -s $CURRENT_PATH/.bashrc ~
[[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc_back
ln -s $CURRENT_PATH/.vimrc ~
[[ -d ~/.vim ]] && mv ~/.vim ~/.vim_back
ln -s $CURRENT_PATH/.vim ~
[[ -f ~/.gitconfig ]] && mv ~/.gitconfig ~/.gitconfig_back
ln -s $CURRENT_PATH/.gitconfig ~
[[ -f ~/.gitignore ]] && mv ~/.gitignore ~/.gitignore_back
ln -s $CURRENT_PATH/.gitignore ~
[[ -f ~/.tmux.conf ]] && mv ~/.tmux.conf ~/.tmux.conf_back
ln -s $CURRENT_PATH/.tmux.conf ~

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

echo "Adding vim configuration and plugins"
pushd ~/.vim
mkdir -p bundle swapdir undodir nvim_swapdir nvim_undodir
pushd bundle
git clone https://github.com/VundleVim/Vundle.vim.git
vim -c "PluginInstall" -c "q" -c "q"
popd
popd

echo "Installing YouCompleteMe"
pushd ~/.vim/bundle/youcompleteme
sudo apt install default-jre npm golang
python3 install.py --clangd-completer --all --verbose
popd
