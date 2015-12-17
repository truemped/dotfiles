PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"

if [[ -d /usr/local/share/npm/bin ]]; then
    PATH="/usr/local/share/npm/bin:$PATH"
fi
export PATH
