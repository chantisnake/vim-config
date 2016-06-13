sudo apt-get install vim
cd ~
git clone https://github.com/chantisnake/vim-config ~/.vim
echo "source ~/vimfiles/gvim_config.vim" > .vimrc
vim +PluginInstall +qa
