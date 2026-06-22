# New Mac Checklist

Ordered, start-to-finish migration to the MacBook Pro M5 Pro. Back to [[Overview]].

## 0. Before migrating (on the old Mac)

- [ ] If keeping it, securely copy `~/.ssh/id_ed25519(.pub)` ([[Secrets and Manual Steps]])
- [ ] Check `mas list` output — did the App Store IDs change ([[Packages - Brewfile]])
- [ ] Push the latest state of the repo

## 1. First boot

- [ ] Finish macOS setup, sign in with your Apple ID
- [ ] **Sign in to the App Store** (required for mas)
- [ ] Clone the repo: `git clone <repo> ~/Projects/dotfiles`

## 2. One command

- [ ] `cd ~/Projects/dotfiles && chmod +x ./install.sh && ./install.sh`

This does everything in [[Installation Flow]]: brew + Brewfile, dotfile symlinks, VSCode extensions, Node/Ruby/Python versions, global npm packages, macOS defaults.

> If an `xcode-select` GUI window opens, wait for it to finish and re-run `./install.sh` if needed. The SSH-key step pauses for a passphrase prompt.

## 3. Post-install authentication

- [ ] `gh auth login`
- [ ] `gcloud init` + `gcloud auth login` + `gcloud auth application-default login`
- [ ] `wrangler login`
- [ ] `docker login` (if needed)
- [ ] Postman / Sketch / OpenVPN profiles — sign in & re-import

## 4. Secret-bearing tools (by hand)

- [ ] Re-enter any per-tool API token `.env` files (rotate the tokens) ([[Secrets and Manual Steps]])
- [ ] Re-download any Google service-account keys
- [ ] FileZilla / qBittorrent servers & passwords

## 5. Non-brew apps

- [ ] DaVinci Resolve + Blackmagic (blackmagicdesign.com)
- [ ] CP210x USB driver (Silicon Labs)
- [ ] Chrome Remote Desktop Host (Google)

## 6. Verification

- [ ] Open a new terminal → green prompt, aliases work (`gs`, `..`)
- [ ] `node -v` → 22.11.0, `ruby -v` → 3.3.5, `python --version` → 3.13.1
- [ ] `git --version` → recent (security-patched), `git config --get user.email` → your email
- [ ] `brew bundle check` → "dependencies are satisfied"
- [ ] Dark mode, Dock magnification, clock format, etc. in place
- [ ] `code --list-extensions` matches the expected set
- [ ] Enable iTerm2 Secure Keyboard Entry; verify `fdesetup status` (FileVault) ([[Secrets and Manual Steps]])
