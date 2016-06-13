sudo apt-get install vim
cd ~
git clone https://github.com/chantisnake/vim-config ~/.vim
echo "source ~/.vim/gvim_config.vim" > .vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qa
