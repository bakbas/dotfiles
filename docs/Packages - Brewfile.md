# Packages - Brewfile

`Brewfile` is a declarative list read by `brew bundle` (inside [[Installation Flow|brew.sh]]). It has three line types: `brew` (CLI formula), `cask` (GUI app), `mas` (Mac App Store).

## The idea

If you want something reinstalled, **add it to the Brewfile**. Remove a line and it won't be reinstalled (but the existing install stays — use `brew bundle cleanup` for that).

## brew — command-line tools

Core: `ffmpeg git nvm openssl@3 pyenv rbenv tmux watchman zsh-autosuggestions zsh-syntax-highlighting huggingface-cli ollama cmake protobuf rustup wget`

Added for the M5 Pro migration: `gh` (GitHub CLI), `mas` (App Store CLI), `dive` (Docker image layers), `ansible`. Plus build dependencies for `rbenv`/`pyenv` source builds: `libyaml`, `readline`, `xz`, `sqlite` ([[Node and Ruby Versions]]).

> Note: `openssl` → `openssl@3` and `docker` → `docker-desktop` (Homebrew renamed them).

## cask — applications

Browsers, editors, messaging, media, etc. For a developer machine the browser set is intentionally broad (cross-browser testing). Notable additions: `claude-code`, `gcloud-cli`, `obsidian`, `zoom`, `microsoft-teams`, `tor-browser`, `google-drive`, `virtualbox`, `raspberry-pi-imager`, `logi-options-plus`, `logitune`, `openvpn-connect`, `sketch`.

## mas — Mac App Store

`mas` makes App Store apps declarative too. **Prerequisite:** sign in to the App Store *before* `brew bundle` runs, otherwise these lines fail ([[Secrets and Manual Steps]]).

| App | ID |
|---|---|
| Xcode | 497799835 |
| Numbers | 409203825 |
| The Unarchiver | 425424353 |

Refresh IDs by running `mas list` on the old machine.

## Not installable via brew

These aren't automated by `brew`/`mas` and are installed by hand in [[Secrets and Manual Steps]]: the **DaVinci Resolve + Blackmagic** suite (blackmagicdesign.com), the **CP210x USB driver** (Silicon Labs), and **Chrome Remote Desktop Host**.
