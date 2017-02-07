$location = Get-Location

Set-Location $HOME

Write-Host 'begin to clone the repo into local' -ForegroundColor Green
git clone git@github.com:chantisnake/vim-config.git .\vimfiles
git clone https://github.com/VundleVim/Vundle.vim.git .\vimfiles\bundle\Vundle.vim 

Write-Host 'git clone finished, begin writing .ideavimrc' -ForegroundColor Green
'source ~/vimfiles/idea_vim_config.vim' | Out-File "./.ideavimrc" -Encoding UTF8

Write-Host 'ideavimrc finished writing, begin writing vimrc' -ForegroundColor Green
'source ~/vimfiles/gvim_config.vim' | Out-File "./_vimrc" -Encoding UTF8

Write-Host 'vimrc write finished, begin writing vsvimrc' -ForegroundColor Green
'source ~/vimfiles/vs_vim_config.vim' | Out-File "./_vsvimrc"

Invoke-Expression 'gvim +PluginInstall +qa'

Set-Location $location
