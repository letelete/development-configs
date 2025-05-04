# --- BEGIN OMZ CONFIG ---
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="apple"
source $ZSH/oh-my-zsh.sh
# --- END OMZ CONFIG ---

# --- BEGIN SYSTEM CONFIG ---
# do not open previous previewed files (e.g. PDFs) when opening a new one
defaults write com.apple.Preview ApplePersistenceIgnoreState YES
# show remaining battery time; show percentage
defaults write com.apple.menuextra.battery ShowTime -string "YES"
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# show Library folder
chflags nohidden ~/Library
# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES
# show path bar
defaults write com.apple.finder ShowPathbar -bool true
# show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
for app in SystemUIServer Dock Finder; do killall "$app" >/dev/null 2>&1; done
# --- END SYSTEM CONFIG ---

# --- BEGIN GIT CONFIG ---
git config --global user.name "letelete"
git config --global user.email "brunokawka@gmail.com"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global init.defaultBranch main
# --- END GIT CONFIG ---

# --- BEGIN ALIAS CONFIG ---
alias push='git push origin "$(git symbolic-ref --short HEAD)"'
alias pull='git pull origin "$(git symbolic-ref --short HEAD)"'
alias l="ls -lah"
# --- END ALIAS CONFIG ---

# --- BEGIN GPG SYMMETRIC ARCHIVE ---
# Input: $1 - directory name
archive_pack() {
    tar cfz "$1.tar.gz" "$1" &&
        gpg -o "$1.tar.gz.gpg" --symmetric --cipher-algo aes256 --digest-algo sha256 --cert-digest-algo sha256 --compress-algo none -z 0 --s2k-mode 3 --s2k-digest-algo sha512 --s2k-count 65011712 --force-mdc --quiet --no-greeting --no-symkey-cache "$1.tar.gz" &&
        find "$1" -type f -exec shred -vzun 13 {} \; &&
        rm -rf "$1" &&
        shred -vzun 13 "$1.tar.gz"
}
# Input: $1 - directory name
archive_unpack() {
    gpg -d --use-embedded-filename "$1.tar.gz.gpg" &&
        tar xf "$1.tar.gz" &&
        shred -vzun 13 "$1.tar.gz.gpg" "$1.tar.gz"
}
# --- END GPG SYMMETRIC ARCHIVE COMPRESSION ---
