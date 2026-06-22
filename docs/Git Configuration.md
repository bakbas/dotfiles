# Git Configuration

Added to the repo during the M5 Pro migration — git settings were previously **not** under version control at all. Back to [[Overview]].

## .gitconfig

Symlinked to `~/.gitconfig` by [[Installation Flow]]. It holds no secrets, so it can be committed verbatim:

```ini
[user]
    name = <your name>
    email = <your email>
[init]
    defaultBranch = main
[pull]
    rebase = false            # merge-style pulls
[credential]
    helper = osxkeychain      # credentials stored in the macOS Keychain
```

> Forking this repo? Change `user.name` / `user.email` to your own.

`credential.helper = osxkeychain` means tokens/passwords are written to the encrypted login keychain rather than a plaintext `~/.git-credentials` file — so no secret ever lands in the repo.

## Global gitignore

The repo's `git/ignore` is symlinked to `~/.config/git/ignore`. Git reads that path **automatically** when `core.excludesfile` is unset — no extra config needed.

It ignores things you never want committed in any project:
- `**/.claude/settings.local.json` — keeps local Claude Code settings out of commits
- macOS cruft (`.DS_Store`, …), editor cruft (`*.swp`, `.idea/`), Windows cruft (`Thumbs.db`)

## GitHub authentication

`.gitconfig` sets your identity, but **GitHub access** is separate. On a new Mac, run the `gh auth login` step in [[Secrets and Manual Steps]].
