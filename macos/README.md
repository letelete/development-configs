# MacOS Development Config

## Apps & Tools

### Installation 

#### Prerequisites

##### Install Homebrew:

```sh
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com Homebrew/install/HEAD/install.sh)"
$ brew update
```

##### Install Oh-My-ZSH

```sh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
$ omz update
```

#### Install via terminal with `brew bundle`

1. Copy [Brewfile](./Brewfile) to your `$HOME` directory.
2. Run `$ brew bundle install` [(See usage)](https://docs.brew.sh/Brew-Bundle-and-Brewfile).

### Create Terminal setup file

Copy [.zshrc](./.zshrc) to your `$HOME` directory.

### VSCode

#### Use recommended snippets

Copy [snippets](../vscode/snippets/) to your `Code > User > snippets` directory
  
#### Development Font: 

[Commit Mono](https://commitmono.com)

##### Custom settings:

```json
{
  "weight": 400,
  "italic": false,
  "alternates": {
    "cv01": false,
    "cv02": false,
    "cv03": false,
    "cv04": false,
    "cv05": true,
    "cv06": false,
    "cv07": true,
    "cv08": false,
    "cv09": false,
    "cv10": false,
    "cv11": false
  },
  "features": {
    "ss01": true,
    "ss02": true,
    "ss03": true,
    "ss04": true,
    "ss05": true
  },
  "letterSpacing": 0,
  "lineHeight": 1,
  "fontName": "Dev"
}
```

### Use Karabiner-Elements config

In Karabiner-Elements, import recommended config [karabiner.json](./karabiner.json).

### Use Rectangle config

In Rectangle, import recommended config [rectangle-config.json](./rectangle-config.json).

## System Settings

### General

#### About

Name: `<custom>`

### Desktop & Dock

- size: `25%`
- magnification: `40%`
- position on screen: `bottom`
- automatically hide and show the Dock: `true`
- show indicators for open applications: `true`
- automatically hide and show the menu bar: `true`
- close windows when quitting an application: `true`
- default web browser: `Brave Browser.app`

### Displays

#### Night shift

- Turned on: `true`
- Schedule: `Sunset to Sunrise`
- Color temperature: `50%`

### Wallpaper

`Solid Black Color`

### Screen Saver

Name: `Fliqlo`

- Time format: `24-hour`
- Scale: `0%`
- Brightness: `100%`
- Show: `background`, `on multiple displays`

### Keyboard

- Key repeat rate: `fast 100%`
- Delay until repeat: `short 100%`

### Trackpad

- Tracking speed: `60%`
- Click: `Light`
- Force Click and haptic feedback: `true`
- Look up & data sectors: `force click with one finger`
- Secondary click: `click or tap with two fingers`
- Tap to click: `true`

### Lock Screen

- Require password after screen saved begins or display is turned off: `immediately`


