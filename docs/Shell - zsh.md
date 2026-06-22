# Shell - zsh

Shell configuration lives in two files: `.zshrc` (environment) and `.zsh_alias` (shortcuts). Both are symlinked into home by [[Installation Flow]].

## What .zshrc sets up

- **PATH** — `/opt/homebrew/bin` first (Apple Silicon). This is why the repo is ready for the M5 Pro out of the box; the old Intel Mac's `/usr/local` paths are not carried over.
- **nvm** — lazy-loaded ([[Node and Ruby Versions]]). Lazy loading defers Node setup to the first `node`/`npm` call instead of every shell start, so the shell opens fast.
- **rbenv** and **pyenv** — activated via `eval "$(... init)"`.
- **JAVA_HOME** — now **guarded**: only exported when `/usr/libexec/java_home` actually finds a JDK, so it never becomes an empty string that breaks Java tooling.
- **ANDROID_HOME** — SDK + emulator + platform-tools on PATH.
- **zsh plugins** — `zsh-syntax-highlighting` and `zsh-autosuggestions` are sourced from brew.

## .zsh_alias

Loaded at the end of `.zshrc` via `source ~/.zsh_alias`. Contains:
- Directory navigation: `..`, `...`, `....`, `~`
- `o`/`oo` (open), `f` (find | grep)
- Git shortcuts: `gs gb gc gcb gcm ga gr grh gpso gplo grom` etc. (`grom` rebases onto `origin/main`, matching the configured default branch).

## Prompt

A plain zsh PS1 (`%F{green}%1d: %f` → green, just the current directory name). No oh-my-zsh / powerlevel10k / starship — kept deliberately minimal.
