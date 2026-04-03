[ -f "$HOME/.config/shell/interactive.sh" ] && . "$HOME/.config/shell/interactive.sh"

[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# Docker CLI completions
[ -f /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion ] && \
  . /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
