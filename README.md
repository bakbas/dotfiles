# dotfiles

Personal setup scripts that bring a new Mac to a fully equipped state with one command.

## Installation

```bash
git clone https://github.com/bakbas/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
./install.sh
```

> `install.sh` is committed with the executable bit, so a `git clone` makes it runnable directly — no `chmod` needed. (Only if you download the repo as a ZIP, run `sh install.sh` instead.)
>
> **Forking this?** Change the git identity to your own: `user.name` / `user.email` in [.gitconfig](.gitconfig) and the `ssh-keygen -C` comment in [install.sh](install.sh). No secrets are stored in this repo — see [docs/Secrets and Manual Steps](docs/Secrets%20and%20Manual%20Steps.md).

## Documentation

Detailed, interlinked notes live in `docs/` as an **Obsidian vault**. Start here: [docs/Overview](docs/Overview.md).

Migration to a new machine, step by step: [docs/New Mac Checklist](docs/New%20Mac%20Checklist.md).
