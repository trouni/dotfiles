echo "Running custom config"

# Default code folder
CODE=$HOME/Dropbox/Code

# zsh custom themes
# CURRENT_DIR=`pwd`
# ZSH_THEMES_DIR="$HOME/.oh-my-zsh/custom/themes"
# mkdir -p "$ZSH_THEMES_DIR" && cd "$ZSH_THEMES_DIR"
# if [ ! -d "$ZSH_THEMES_DIR/powerlevel9k" ]; then
#   echo "-----> Installing zsh 'powerlevel9k' theme..."
#   git clone https://github.com/bhilburn/powerlevel9k.git
# fi
# cd "$CURRENT_DIR"

plugins=(gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search)

# VSCode
setopt nocasematch
if [[ ! `uname` =~ "darwin" ]]; then
  git config --global core.editor "subl -n -w $@ >/dev/null 2>&1"
  echo 'export BUNDLER_EDITOR="subl $@ >/dev/null 2>&1 -a"' >> zshrc
else
  git config --global core.editor "code -n -w"
  bundler_editor="code"
  echo "export BUNDLER_EDITOR=\"${bundler_editor} -a\"" >> zshrc
fi