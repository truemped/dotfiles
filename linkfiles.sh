#!/bin/zsh

FILES="gitconfig
gitignore
irssi
nvimrc
screenrc
spacemacs
tmux.conf
vim
vimrc
zshenv
zshrc"

for f in ${(f)FILES}; do
    echo ln -s $f ~/.$f
done

# themes
for f in ./oh-my-zsh/themes/*; do
    echo ln -s $f ~/.oh-my-zsh/themes/${f:t}
done
