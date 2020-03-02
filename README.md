## Command Line Tools
```zsh
xcode-select --install
```
## Homebrew
```zsh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
sudo chown -R $(whoami) $(brew --prefix)/*
brew update
function install_or_upgrade { brew ls | grep $1 > /dev/null; if (($? == 0)); then brew upgrade $1; else brew install $1; fi }
install_or_upgrade "git"
install_or_upgrade "wget"
install_or_upgrade "imagemagick"
install_or_upgrade "jq"
install_or_upgrade "openssl"
```

## GitHub / SSH
```zsh
mkdir -p ~/.ssh && ssh-keygen -t ed25519 -o -a 100 -f ~/.ssh/id_ed25519 -C "TYPE_YOUR_EMAIL@HERE.com"
cat ~/.ssh/id_ed25519.pub
```
Copy-paste the public SSH key and [add it to GitHub](https://github.com/settings/keys).

Once you started the SSH agent with:
```zsh
eval $(ssh-agent)
```
Add your private key to it:
```zsh
ssh-add -K
```
You will be asked for your passphrase once. `-K` will save the key permanently on macOS.
