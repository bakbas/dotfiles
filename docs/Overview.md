# Overview

> This folder is the **Obsidian vault** for the `dotfiles` repo. Each note covers one topic and links to the others with `[[wiki links]]`. Open this folder as a vault in Obsidian to see how everything connects in graph view.

## Mental model

This repo answers a single question:

> *"When I sit down at a brand-new Mac, how do I restore everything with one command?"*

The answer splits into three layers:

1. **What to install** — packages, apps, extensions → declarative lists (`Brewfile`, `npmfile`, `vscode.extensions`)
2. **How to configure** — personal config files → dotfiles **symlinked** into the home directory (`.zshrc`, `.gitconfig`, …)
3. **How the system behaves** — macOS itself → `defaults write` commands in `macos.sh`

One orchestrator runs all of it: **[[Installation Flow|install.sh]]**.

The golden rule: **no secret (token, password, private key) ever enters the repo.** Anything that needs a secret is done by hand in [[Secrets and Manual Steps]].

> Reusing this repo? Fork it and change the git identity (`.gitconfig` name/email and the `ssh-keygen -C` comment in `install.sh`) to your own.

## Notes

- [[Installation Flow]] — what `install.sh` does, step by step
- [[Packages - Brewfile]] — brew formulae, cask apps, App Store (mas)
- [[Shell - zsh]] — `.zshrc` and `.zsh_alias`
- [[Git Configuration]] — `.gitconfig` and the global gitignore
- [[Node and Ruby Versions]] — version pinning with nvm, rbenv, pyenv
- [[VSCode]] — extension list
- [[macOS Defaults]] — system preferences via `macos.sh`
- [[Secrets and Manual Steps]] — everything that stays out of the repo and must be done by hand
- [[New Mac Checklist]] — ordered, start-to-finish migration list

## Repo map

```
dotfiles/
├── install.sh          # orchestrator → [[Installation Flow]]
├── brew.sh             # installs Homebrew + runs `brew bundle`
├── Brewfile            # [[Packages - Brewfile]]
├── npmfile             # global npm packages
├── vscode.extensions   # [[VSCode]] extensions
├── vscode-extensions.sh
├── macos.sh            # [[macOS Defaults]]
├── .zshrc / .zsh_alias # [[Shell - zsh]]
├── .gitconfig          # [[Git Configuration]]
├── git/ignore          # global gitignore (~/.config/git/ignore)
├── docker-config.json  # ~/.docker/config.json
├── .nuxtrc             # disables Nuxt telemetry
├── .nvmrc / .ruby-version / .python-version  # [[Node and Ruby Versions]]
├── .editorconfig
└── docs/               # this vault
```
