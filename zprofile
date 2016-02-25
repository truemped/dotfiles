if [[ -f /usr/libexec/java_home ]]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
fi

if [[ -d ~/.nvm && -x /usr/local/bin/brew ]]; then
    export NVM_DIR=~/.nvm
    source $(/usr/local/bin/brew --prefix nvm)/nvm.sh
fi

if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
    . /usr/local/bin/virtualenvwrapper.sh
fi
