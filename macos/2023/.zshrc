# --- BEGIN OMZ CONFIG ---
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

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

alias push='git push origin "$(git symbolic-ref --short HEAD)"'
alias pull='git pull origin "$(git symbolic-ref --short HEAD)"'
# --- END GIT CONFIG ---

# --- BEGIN NPM CONFIG ---
npm set init-author-name "Bruno Kawka"
npm set init-author-email "brunokawka@gmail.com"
npm set init-author-url "https://kawka.me"
# npm adduser
# --- END NPM CONFIG ---

# --- BEGIN ANDROID CONFIG ---
export ANDROID_HOME=/Users/brunokawka/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export JAVA_HOME=$(/usr/libexec/java_home -v 11)
# --- END ANDROID CONFIG ---

# --- BEGIN GPG SYMMETRIC ARCHIVE ---
# Input: $1 - directory name
archivepack() {
    tar cfz $1.tar.gz $1 && gpg -o $1.tar.gz.gpg --symmetric --no-symkey-cache $1.tar.gz && rm -rf $1 $1.tar.gz
}

# Input: $1 - directory name
archiveunpack() {
    gpg --use-embedded-filename $1.tar.gz.gpg && tar xf $1.tar.gz && rm -rf $1.tar.gz.gpg $1.tar.gz
}
# --- END GPG SYMMETRIC ARCHIVE COMPRESSION ---

# --- BEGIN TELEGRAM SHARE FILE ---
tgshare() {
    /Applications/Telegram.app/Contents/MacOS/Telegram -sendpath "$(readlink -f "$1")"
    wmctrl -x -a Telegram
}
# --- END TELEGRAM SHARE FILE ---
