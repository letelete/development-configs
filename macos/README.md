# MacOS Web Development Config

**Apps**

- karabiner-elements
- raycast
- rectangle
- bitwarden
- coconutBattery
- vlc
- hammerspoon

- warp (terminal)
- vscode
- postman
- flipper
- android studio
- xcode

- firefox (developer edition)
- brave
- figma
- telegram

**Settings**
General:
Name: `<custom>`

Desktop & Dock:

- size: `25%`
- magnification: `40%`
- position on screen: `bottom`
- automatically hide and show the Dock: `true`
- show indicators for open applications: `true`
- automatically hide and show the menu bar: `true`
- close windows when quitting an application: `true`
- default web browser: `Firefox Developer Edition.app`

Control Center:
Battery:

- show in Menu Bar: `true`
- Show Percentage: `true`

Displays:
Night shift:

- turned on: `true`

Wallpaper: `solid black color`

Screen Saver: `Fliqlo`

- time format: `24-hour`
- scale: `0%`
- brightness: `100%`
- show: `background`, `on multiple displays`

Keyboard:
Key repeat rate: `fast 100%`
Delay until repeat: `short 100%`

Trackpad:

- tracking speed: `60%`
- click: `Light`
- force Click and haptic feedback: `true`
- look up & data sectors: `force click with one finger`
- secondary click: `click or tap with two fingers`
- tap to click: `true`

Lock Screen

- require password after screen saved begins or display is turned off: `immediately`

**Installation**
Homebrew

```bash
# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
omz update

brew install \
    git \
    node \
    npm \
    wmctrl \
    direnv

npm install -g \
    npm \
    corepack \
    n \

corepack enable
corepack prepare yarn@stable --activate
yarn set version stable
```
