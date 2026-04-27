path_prepend() {
    case ":$PATH:" in
        *":$1:"*)
            PATH=${PATH//":$1:"/:}
            PATH=${PATH/#"$1:"/}
            PATH=${PATH/%":$1"/}
            ;;
    esac
    PATH="$1${PATH:+:$PATH}"
}

[ -d /opt/homebrew/bin ] && path_prepend /opt/homebrew/bin
[ -d /opt/homebrew/sbin ] && path_prepend /opt/homebrew/sbin
[ -d /opt/homebrew/opt/ruby/bin ] && path_prepend /opt/homebrew/opt/ruby/bin

if command -v ruby >/dev/null 2>&1; then
    _ruby_gems_bin="$(ruby -e 'puts Gem.default_bindir' 2>/dev/null)"
    [ -d "$_ruby_gems_bin" ] && path_prepend "$_ruby_gems_bin"
    unset _ruby_gems_bin
fi

if command -v python3 >/dev/null 2>&1; then
    _py_user_bin="$(python3 -m site --user-base 2>/dev/null)/bin"
    [ -d "$_py_user_bin" ] && path_prepend "$_py_user_bin"
    unset _py_user_bin
fi

[ -d "$HOME/.elan/bin" ] && path_prepend "$HOME/.elan/bin"
[ -d "$HOME/.pub-cache/bin" ] && path_prepend "$HOME/.pub-cache/bin"
[ -d "$HOME/.fvm_flutter/bin" ] && path_prepend "$HOME/.fvm_flutter/bin"
[ -d "$HOME/fvm/default/bin" ] && path_prepend "$HOME/fvm/default/bin"

if [ "$(uname)" = "Darwin" ]; then
    ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
else
    ANDROID_SDK_ROOT="$HOME/Android/Sdk"
fi
ANDROID_HOME="$ANDROID_SDK_ROOT"

if [ "$(uname)" = "Darwin" ]; then
    if [ -x /usr/libexec/java_home ]; then
        JAVA_HOME="$(/usr/libexec/java_home 2>/dev/null)"
    fi
    [ -z "$JAVA_HOME" ] && JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
fi

if [ "$(uname)" = "Darwin" ]; then
    CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"
elif command -v brave-browser >/dev/null 2>&1; then
    CHROME_EXECUTABLE="$(command -v brave-browser)"
elif command -v brave >/dev/null 2>&1; then
    CHROME_EXECUTABLE="$(command -v brave)"
fi

EDITOR="nvim"
VISUAL="$EDITOR"

[ -d "$ANDROID_SDK_ROOT/platform-tools" ] && path_prepend "$ANDROID_SDK_ROOT/platform-tools"
[ -n "$JAVA_HOME" ] && [ -d "$JAVA_HOME/bin" ] && path_prepend "$JAVA_HOME/bin"

export PATH
export NVM_DIR="$HOME/.nvm"
export ANDROID_SDK_ROOT
export ANDROID_HOME
export JAVA_HOME
export CHROME_EXECUTABLE
export EDITOR
export VISUAL

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
