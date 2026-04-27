[ -f "$HOME/.config/shell/env.sh" ] && . "$HOME/.config/shell/env.sh"
[ -f "$HOME/.config/shell/interactive.sh" ] && . "$HOME/.config/shell/interactive.sh"

[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Docker CLI completions
if [ -f /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion ]; then
    . /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
elif [ -f /usr/share/bash-completion/completions/docker ]; then
    . /usr/share/bash-completion/completions/docker
fi
