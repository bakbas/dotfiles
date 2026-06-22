# Secrets and Manual Steps

The **iron rule** of this repo: no secret (token, password, private key) ever goes into version control. The steps below live **outside** `install.sh` and are done by hand on a new Mac. Back to [[Overview]].

## Re-authenticate (no copying — log in fresh)

| Tool | Command / step |
|---|---|
| GitHub CLI | `gh auth login` |
| Google Cloud | `gcloud init` → `gcloud auth login` → `gcloud auth application-default login` |
| Cloudflare Wrangler | `wrangler login` |
| Docker registry | `docker login` (credentials go to the Keychain; `~/.docker/config.json` structure is already in the repo) |
| Postman / Sketch / etc. | sign in / re-activate license |

## Secret-bearing config that is NOT in the repo

These are recreated by the tool on first run, or re-entered by hand — never committed:

- `~/.config/gh/hosts.yml` — GitHub OAuth token (refreshed by `gh auth login` above)
- `~/.config/gcloud/` — OAuth / ADC tokens (re-auth)
- Any per-tool `.env` files holding API tokens (e.g. Cloudflare / R2 / Resend / email keys) and any Google **service-account** JSON keys → re-enter from your password manager or re-download the key; rotate anything that may have been exposed
- FileZilla / qBittorrent saved servers & passwords → re-enter by hand

## App Store (mas) prerequisite

Sign in to the App Store **before** `brew bundle` runs, or the `mas` lines in the [[Packages - Brewfile|Brewfile]] will fail.

## Apps not installable via Homebrew

- **DaVinci Resolve + Blackmagic RAW / Proxy Generator** → download from blackmagicdesign.com
- **CP210x VCP USB driver** (Arduino/ESP boards) → from Silicon Labs
- **Chrome Remote Desktop Host** → from Google

## SSH key

`install.sh` generates a **new** `id_ed25519` key. To keep your existing key (so GitHub/server access doesn't break), copy `~/.ssh/id_ed25519` (or an old `id_rsa`) and its `.pub` from the old Mac by hand (USB / encrypted transfer) — never put it in the repo. If you generate a new key, add the public part to GitHub/servers.

## Optional hardening (do by hand)

- **iTerm2 → Secure Keyboard Entry** (iTerm2 menu): `macos.sh` only sets this for Apple Terminal.app, but iTerm2 is the primary terminal.
- **Verify FileVault is on** (`fdesetup status`): the repo does not enable full-disk encryption.
- **Commit signing** (optional): you can add SSH-based signing to `.gitconfig` (`gpg.format = ssh`, `user.signingkey = ~/.ssh/id_ed25519.pub`, `commit.gpgsign = true`) after adding the key to GitHub as a signing key.

## Intentionally not migrated

- Legacy RVM dotfiles (`.bashrc .bash_profile .profile .zlogin`) and orphan LaunchAgents — dead leftovers.
- Any personal scheduled LaunchAgents (cron-like jobs) — re-create by hand if needed; keep the job's `.env` secrets out of the repo.
- **iTerm2 / Raycast / Karabiner** settings — none were customized. Going forward: iTerm2 "Load preferences from a custom folder" → repo; Raycast Settings → Advanced → Export.
