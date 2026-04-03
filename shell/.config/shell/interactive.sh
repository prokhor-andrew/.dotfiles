case $- in
    *i*) ;;
    *) return ;;
esac

alias typora='open -a "Typora"'
alias brave='open -a "Brave Browser"'
alias notes='open -a "Notes"'
alias telegram='open -a "Telegram"'
alias teams='open -a "Microsoft Teams"'
alias outlook='open -a "Microsoft Outlook"'
alias duckduckgo='open -a "DuckDuckGo"'
alias tor-browser='open -a "Tor Browser"'
alias devcleaner='open -a "DevCleaner"'
alias xcode='open -a "Xcode"'
alias webstorm='open -a "WebStorm"'
alias raycast='open -a "Raycast"'
alias settings='open -a "System Settings"'

if [ -z "$TMUX" ] && command -v tmux >/dev/null 2>&1; then
    exec tmux
fi
