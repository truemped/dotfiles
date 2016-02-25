# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

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

export ITERM_PROFILE=Light
export ZSH_THEME="daniel-light"

function iterm-light {
    export ITERM_PROFILE=Light
    export ZSH_THEME="daniel-light"
    source $ZSH/oh-my-zsh.sh
}

function iterm-dark {
    export ITERM_PROFILE=Dark
    export ZSH_THEME="daniel-dark"
    source $ZSH/oh-my-zsh.sh
}

. $ZSH/oh-my-zsh.sh

PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"

if [[ -d /usr/local/share/npm/bin ]]; then
    PATH="/usr/local/share/npm/bin:$PATH"
fi
export PATH
