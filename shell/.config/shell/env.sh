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
[ -d /opt/homebrew/lib/ruby/gems/4.0.0/bin ] && path_prepend /opt/homebrew/lib/ruby/gems/4.0.0/bin
[ -d "$HOME/Library/Python/3.14/bin" ] && path_prepend "$HOME/Library/Python/3.14/bin"
[ -d "$HOME/.elan/bin" ] && path_prepend "$HOME/.elan/bin"
[ -d "$HOME/.pub-cache/bin" ] && path_prepend "$HOME/.pub-cache/bin"
[ -d "$HOME/.fvm_flutter/bin" ] && path_prepend "$HOME/.fvm_flutter/bin"
[ -d "$HOME/fvm/default/bin" ] && path_prepend "$HOME/fvm/default/bin"

ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
ANDROID_HOME="$ANDROID_SDK_ROOT"
JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
CHROME_EXECUTABLE="/Applications/Brave Browser.app/Contents/MacOS/Brave Browser"

[ -d "$ANDROID_SDK_ROOT/platform-tools" ] && path_prepend "$ANDROID_SDK_ROOT/platform-tools"
[ -d "$JAVA_HOME/bin" ] && path_prepend "$JAVA_HOME/bin"

export PATH
export NVM_DIR="$HOME/.nvm"
export ANDROID_SDK_ROOT
export ANDROID_HOME
export JAVA_HOME
export CHROME_EXECUTABLE

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
