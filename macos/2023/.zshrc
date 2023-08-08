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

# set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02

# avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

for app in SystemUIServer Finder; do killall "$app" >/dev/null 2>&1; done
# --- END SYSTEM CONFIG ---

# --- BEGIN ANDROID CONFIG ---
export ANDROID_HOME=/Users/brunokawka/Library/Android/sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/emulator
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
