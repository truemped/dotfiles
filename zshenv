PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

if [[ -d /usr/local/share/npm/bin ]]; then
    PATH=/usr/local/share/npm/bin:$PATH
fi
export PATH


export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
alias emacs="TERM=xterm /usr/local/bin/emacs -nw"
alias emacs="/usr/local/bin/emacs -nw"

if [[ -f /usr/libexec/java_home ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
fi

if [[ -d ~/.nvm && -x /usr/local/bin/brew ]]; then
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
fi

if [[ -f /usr/local/bin/virtualenvwrapper_lazy.sh ]]; then
    . /usr/local/bin/virtualenvwrapper_lazy.sh
fi
