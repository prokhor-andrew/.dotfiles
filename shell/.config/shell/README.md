# Development Setup

Shared shell configuration lives in `~/.config/shell`.

Files:
- `env.sh`: shared environment for login shells
- `interactive.sh`: shared interactive aliases and startup behavior

Shell startup:
- `~/.profile`: sources shared environment for POSIX/login shells
- `~/.bash_profile`: loads `~/.profile` and `~/.bashrc`
- `~/.bashrc`: loads shared interactive shell behavior and bash completions
- `~/.zprofile`: sources `~/.profile` for zsh login shells
- `~/.zshrc`: loads shared interactive shell behavior and zsh completions

Other configs:
- `~/.tmux.conf`: terminal multiplexer behavior
- `~/.inputrc`: readline vi mode
- `~/.gitconfig`: git identity and defaults
- `~/.config/nvim`: primary editor configuration
