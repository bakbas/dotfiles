# macOS Defaults

`macos.sh` turns system preferences into code with `defaults write` commands. It's the **last** step of [[Installation Flow]] because it restarts apps like Dock/Finder with `killall` at the end.

## Mental model

Most macOS settings are a key-value pair under a "domain". `defaults write <domain> <key> <value>` sets them without touching the GUI. E.g. ticking a checkbox in System Settings = one `defaults write` line.

Most changes fully take effect after a logout/restart.

## Already covered (summary)

Computer name (set to `$(whoami)`), disabling smart quotes/dashes/autocorrect, SSD/sleep/energy, screen-lock password, Finder (hidden files, extensions, path bar, desktop icons), Safari developer menu, Terminal UTF-8 + Secure Keyboard Entry, three-finger swipe, etc.

## Added for the M5 Pro migration

| What | Key |
|---|---|
| Dark mode | `NSGlobalDomain AppleInterfaceStyle = Dark` |
| Menu-bar clock: 24h + day of week | `com.apple.menuextra.clock` |
| Dock icon size 42 | `com.apple.dock tilesize 42` |
| Dock magnification | `com.apple.dock magnification + largesize 65` |
| Don't auto-rearrange Spaces | `com.apple.dock mru-spaces false` |
| Finder default list view | `com.apple.finder FXPreferredViewStyle Nlsv` |
| Trackpad tap-to-click | `…AppleMultitouchTrackpad Clicking` + `tapBehavior` |
| Trackpad two-finger right-click | `…TrackpadRightClick` |

> Trimmed for security/privacy: the login-window host-info disclosure (`AdminHostInfo`) and AirDrop-over-all-interfaces (`BrowseAllInterfaces`) were removed; the misleading hot-corner no-op was dropped.

## Editing tip

To persist a new setting: change it in the GUI, read the new value with `defaults read <domain>`, then add the matching `defaults write` line to `macos.sh`. Back to [[Overview]].
