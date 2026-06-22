# Node and Ruby Versions

The version managers themselves (nvm, rbenv, pyenv) live in the [[Packages - Brewfile|Brewfile]]. But **which versions get installed** is separate information that used to live nowhere — a fresh machine had nvm/rbenv installed but not a single node/ruby.

## Three files that fix it

- **`.nvmrc`** → `22.11.0` (the active default Node version)
- **`.ruby-version`** → `3.3.5` (global Ruby)
- **`.python-version`** → `3.13.1` (global Python)

These are both a **pin** and the **source** for [[Installation Flow|install.sh]]: the script reads them to drive the install, so you change a version in one place.

## What install.sh does

```sh
nvm install "$(cat .nvmrc)"   # 22.11.0
nvm install 20.18.0
nvm install 18.17.1
nvm alias default "$(cat .nvmrc)"

rbenv install -s "$(cat .ruby-version)"   # 3.3.5
rbenv global  "$(cat .ruby-version)"

pyenv install -s "$(cat .python-version)" # 3.13.1
pyenv global  "$(cat .python-version)"
```

## Why global npm packages install after Node

Global npm packages ([[Packages - Brewfile|npmfile]]) are **tied to the Node version** — each nvm version has its own global folder. So install.sh installs Node first, runs `nvm use default`, then `npm i -g`. If you change Node versions, reinstall the globals under the new version.

## Build dependencies

rbenv and pyenv **compile** runtimes from source, which needs a few libraries. The Brewfile provides them: `openssl@3`, `libyaml`, `readline`, `xz`, `sqlite`. Without these, a from-source Ruby/Python build can fail.

## Rust

`rustup` is in the Brewfile but no toolchain is pinned. On a new Mac, run `rustup-init` / `rustup default stable`. If you later add a `~/.cargo/config.toml`, track it then.
