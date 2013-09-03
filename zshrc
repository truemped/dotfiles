# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
# export ZSH_THEME="steeef"
#export ZSH_THEME="afowler"
#export ZSH_THEME="blinks"
#export ZSH_THEME="tjkirch"
export ZSH_THEME="frisk"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

plugins=(git osx python compleat zypper)

source $ZSH/oh-my-zsh.sh

export CD_ABLE_VARS="true"

path=(/usr/local/bin $path)
path=(/opt/local/bin $path)
path=(/usr/local/share/python $path)
path=(/Users/daniel/Source/java/storm/storm-0.8.2/bin $path)
path=(/usr/local/share/npm/lib/node_modules/grunt-cli/bin/ $path)
path=(/usr/local/share/npm/bin $path)

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

alias vim=/usr/local/Cellar/macvim/7.3-66/MacVim.app/Contents/MacOS/Vim
