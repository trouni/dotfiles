# Default code folder
CODE=$HOME/Code
C=$HOME/Code
DOT=$HOME/Code/dotfiles
DOTFILES=$HOME/Code/dotfiles
LECTURES=$HOME/Code/lewagon/lectures
DSLECTURES=$HOME/Code/lewagon/lectures/data-science

# ZSH folder
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="zhann"
# ZSH_THEME="af-magic"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# ZSH plugins
# Unused: zsh-autosuggestions
plugins=(git gitfast last-working-dir common-aliases sublime zsh-syntax-highlighting history-substring-search)

# (macOS-only) Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"
unalias rm # No interactive rm by default (brought by plugins/common-aliases)

# Load rbenv if installed (To manage your Ruby versions)
export PATH="${HOME}/.rbenv/bin:${PATH}" # Needed for Linux/WSL
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Load pyenv (To manage your Python versions)
export PATH="${HOME}/.pyenv/bin:${PATH}" # Needed for Linux/WSL
type -a pyenv > /dev/null && eval "$(pyenv init -)" && eval "$(pyenv virtualenv-init -)"

# Load nvm if installed (To manage your Node versions)
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# Same for `./node_modules/.bin` and nodejs
export PATH="./bin:./node_modules/.bin:${PATH}:/usr/local/sbin"

# Store your own aliases in the ~/.aliases file and load them here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Log SSL keys
export SSLKEYLOGFILE=~/.ssl-key.log

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR="code -a"

# >>> Prompt >>>
# export PROMPT='$FG[237]${(l.COLUMNS..-.)}%{$reset_color%}
# $FG[032]%1~\
# $(git_prompt_info)$(hg_prompt_info) \
# $FG[105]%(!.#.»)%{$reset_color%} '
# export PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
# <<< Prompt <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/trouni/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/trouni/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/trouni/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/trouni/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# Use iPython for breakpoint()
export PYTHONBREAKPOINT=IPython.core.debugger.set_trace

# PYTHONPATH for data-challenges
# export PYTHONPATH="/Users/trouni/Code/lewagon/data-challenges-recap/04-Decision-Science:$PYTHONPATH"