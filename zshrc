# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="frisk"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

CD_ABLE_VARS="true"

TERM=xterm-256color

plugins=(git osx compleat brew tmux)

source $ZSH/oh-my-zsh.sh

source /usr/local/bin/virtualenvwrapper_lazy.sh

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
