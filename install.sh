backup() {
  target=$1
  if [ -e "$target" ]; then           # Does the config file already exist?
    if [ ! -L "$target" ]; then       # as a pure file?
      mv "$target" "$target.backup"   # Then back it up
      echo "-----> Moved $target config file to $target.backup"
    fi
  fi
}

create_or_update_symlink() {
  file=$1
  target=$2
  if [ ! -L "$target" ]; then
    echo "-----> Symlinking your new $target"
    ln -s "$file" "$target"
  else
    rm "$target"
    echo "-----> Removed Symlink: $target"
    echo "-----> Recreating Symlink for your new $target"
    ln -s "$file" "$target"
  fi
}

#!/bin/zsh
for name in *; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    if [[ ! "$name" =~ '\.sh$' ]] && [ "$name" != 'README.md' ] && [[ ! "$name" =~ '\.sublime-settings$' ]]; then
      backup $target

      create_or_update_symlink $PWD/$name $target
    fi
  fi
done

REGULAR="\\033[0;39m"
YELLOW="\\033[1;33m"
GREEN="\\033[1;32m"

# zsh plugins
CURRENT_DIR=`pwd`
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
fi
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" ]; then
  echo "-----> Installing zsh plugin 'zsh-autosuggestions'..."
  git clone https://github.com/zsh-users/zsh-autosuggestions.git
fi
cd "$CURRENT_DIR"

# Sublime Text
if [[ ! `uname` =~ "darwin" ]]; then
  SUBL_PATH=~/.config/sublime-text-3
else
  SUBL_PATH=~/Library/Application\ Support/Sublime\ Text\ 3
fi
mkdir -p $SUBL_PATH/Packages/User $SUBL_PATH/Installed\ Packages
backup "$SUBL_PATH/Packages/User/Preferences.sublime-settings"
curl -k https://sublime.wbond.net/Package%20Control.sublime-package > $SUBL_PATH/Installed\ Packages/Package\ Control.sublime-package
create_or_update_symlink $PWD/sublime/Preferences.sublime-settings $SUBL_PATH/Packages/User/Preferences.sublime-settings
create_or_update_symlink $PWD/sublime/Package\ Control.sublime-settings $SUBL_PATH/Packages/User/Package\ Control.sublime-settings
create_or_update_symlink $PWD/sublime/SublimeLinter.sublime-settings $SUBL_PATH/Packages/User/SublimeLinter.sublime-settings

# VS Code
VSCODE_PATH=$HOME/Library/Application\ Support/Code
mkdir -p $VSCODE_PATH/User
backup "$VSCODE_PATH/User/settings.json"
create_or_update_symlink $PWD/vscode/settings.json $VSCODE_PATH/User/settings.json

zsh ~/.zshrc

# Git
git config --global core.excludesfile '~/.gitignore_global'
echo "👌  Carry on with git setup!"
