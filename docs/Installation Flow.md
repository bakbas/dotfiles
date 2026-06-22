# Installation Flow

`install.sh` is the single entry point that turns a bare Mac into a fully equipped dev machine. Back to [[Overview]].

## Running it

```bash
chmod +x ./install.sh
./install.sh
```

The script resolves its own directory into `DOTFILES` and `cd`s into it, so it works no matter where you clone the repo.

## Steps (in order)

1. **`sudo -v`** — asks for the admin password up front so later `sudo` calls don't block.
2. **SSH key** — if `~/.ssh/id_ed25519.pub` is missing, generates a new ed25519 key. ⚠️ This is a **new** key and `ssh-keygen` prompts interactively for a path and passphrase, so the run pauses here. See [[Secrets and Manual Steps]] to carry over an existing key.
3. **xcode-select** — installs the Command Line Tools if absent (git, clang, make, etc. depend on them).
4. **`brew.sh`** — installs Homebrew if missing, then `brew bundle` installs everything in the [[Packages - Brewfile|Brewfile]].
5. **PATH** — `/opt/homebrew/bin` is added to PATH so the rest of the script can see brew tools (Apple Silicon path).
6. **Symlink dotfiles** — personal config files are **linked** (not copied) into home:
   - `.zshrc`, `.zsh_alias` → `~/`  ([[Shell - zsh]])
   - `.gitconfig` → `~/`  ([[Git Configuration]])
   - `.nuxtrc` → `~/`
   - `git/ignore` → `~/.config/git/ignore`
   - `docker-config.json` → `~/.docker/config.json`
7. **`vscode-extensions.sh`** — installs the [[VSCode]] extensions.
8. **Node** — loads nvm, installs the version in `.nvmrc` + 20/18, sets the default ([[Node and Ruby Versions]]).
9. **Global npm packages** — reads `npmfile` and installs with `npm i -g`. Runs **after** Node so npm exists.
10. **Ruby & Python** — `rbenv` installs `.ruby-version` and `pyenv` installs `.python-version`, each set as global.
11. **`macos.sh`** — applies [[macOS Defaults]] (last, because it restarts apps like Dock/Finder at the end).

## Why symlinks, not copies?

With symlinks, editing `~/.zshrc` actually edits the file in the repo → you see the change with `git diff` and commit it. With copies, the repo and machine would drift apart over time (this is exactly what happened once on the old Intel Mac: `~/.zshrc` was stuck on an old copy).

## Known fragilities

- `vscode-extensions.sh` expects the `code` command on PATH. The VS Code cask doesn't always add it; if missing, run **Cmd+Shift+P → "Shell Command: Install 'code' command in PATH"** inside VS Code.
- `xcode-select --install` opens a GUI window and the script does **not** wait for it; let the install finish, then re-run the script if needed.
