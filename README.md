
<h1 align=center>Crawraps' Widgets Collection</h1>

<div align=center>
  
A customizable collection of QML widgets built with the [quickshell](https://quickshell.outfoxxed.me/) environment.

</div>

https://github.com/user-attachments/assets/8cd1d3f1-74a7-4dd4-baf0-7fa908daabce

## Installation

### Manual installation

1. **Dependencies:**  
   Install core dependency - [quickshell](https://quickshell.outfoxxed.me/docs/guide/install-setup/)

   > Some widgets may require additional dependencies for extra features. Read the widget overview before using it

3. **Clone the Repository:**
   ```sh
   $ git clone https://github.com/crawraps/widgets-collection $HOME/.config/quickshell/cwc
   ```

   > if $XDG_CONFIG_HOME is not defined, use $HOME/.config instead

## Usage

1. Select widgets you want to use by editing `shell.qml` file. Example:
```qml
// shell.qml

...

ShellRoot {
  Dock {} // dock widget with the default configuration
}
```

> Each widgets creates an instance for each monitor by default. You can configure this behaviour, read configuration for details.

2. Start shell by typing `$ quickshell -c cwc` or `$ quickshell -dc cwc` to run as daemon.
3. *\*optional\** Add the command above to system startup. For example in hyprland add `exec-once=quickshell -dc cwc` to your hyprland.conf
4. *\*optional\** Create an alias for better usability. For example in zsh add `alias -- cwc='quickshell -c cwc'` to your .zshrc

## Configuration

You can configure widgets and appearance by changing `.json` files. Every config file supports hot-reload.

### Appearance Configuration

Global appearance (colors, fonts, spacing, etc.) is managed via `appearance.json` in your config directory (e.g., `$HOME/.config/quickshell/cwc/appearance.json`):

```json
{
  "colors": {
    "primary": "#007acc",
    "background": "#20242b"
  },
  "font": {
    "family": { "regular": "Fira Sans" },
    "size": { "xm": 10 }
  },
  "spacing": { "small": 8 },
  "rounding": { "small": 4, "medium": 8 },
  "animation": { "duration": { "normal": 200, "sequential": 50 } },
  "opacity": 0.85
}
```

### Widgets configuration

Each widget can have several widget-specific configuration files, each one is located in `widgets/[widget-name]/configs/` directory.

While selecting a widget to use, you can provide several common options:

```qml
// shell.qml

...

  Dock {
    configName: "power-menu"
    monitorInds: [0]
    screens: [Quickshell.screens.reduce((acc, screen) => screen.x > acc.x ? screen : acc, { x: -Infinity })]
  }
```

- **configName:** name of a `.json` configuration file. Default: `"config"` In this example it'll be `widgets/dock/configs/power-menu.json`
- **monitorInds:** list of screens ids where widget should be displayed. Default: every screen
- **screens:** list of screens where widget should be displayed. When this option is presented, **monitorInds** option will be ignored. Use this for more precise configuration. In the example the dock will be displayed on the rightmost screen.

## Widgets

### Dock

<details>
<summary>Showcase</summary>
  
https://github.com/user-attachments/assets/9c57d09c-0931-4146-995b-eb85c1595df5

https://github.com/user-attachments/assets/5544e0da-eee4-4849-af37-8fa03f177b61
</details>

Each dock can be configured with a JSON file (e.g., `configs/applications.json`):

```json
{
  "position": "bottom",
  "orientation": "horizontal",
  "margins": {
    "right": 200
  },
  "items": [
    "Zen",
    "Obsidian",
    "Thunderbird",
  ],
  "iconSize": 48,
  "alwaysVisible": false,
  "showIconsBackground": true,
  "showTooltips": true,
  "falloff": 3,
  "scaleFactor": 0.3,
  "damp": 1
}
```

- **position:** `"top"`, `"bottom"`, `"left"`, `"right"` - where to put a dock
- **orientation:** `"horizontal"` or `"vertical"` - how to orient a dock
- **margins:** `{ "bottom": number, "top": number, "right": number, "left": number }` - spacing from screen edges. By default a dock will be in the center of **position** edge
- **items:** list of `.desktop` files app names to show; if not defined, all desktop applications will be listed.
- **iconSize:** size of an icon in pixels 
- **alwaysVisible:** if false, dock expands/collapses on hover
- **showIconsBackground:** whether to show background for icons
- **showTooltips:** whether to display tooltips
- **falloff:** amount of items to be affected by hover animation
- **scaleFactor:** controls item's hover scaling animation strength
- **damp:** controls nearby items' hover scaling animation strength

## Future

Here's a list of widgets I want to create:

- [x] dock
- [ ] launcher
- [ ] translator/dictionary
- [ ] weather display
- [ ] emoji picker
- [ ] mpris
- [ ] system info display
- [ ] feature-rich calendar
