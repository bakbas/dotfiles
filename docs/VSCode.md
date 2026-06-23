# VSCode

VS Code itself is a cask in the [[Packages - Brewfile|Brewfile]]. Extensions are managed separately.

## How it works

- `vscode.extensions` — one extension ID per line (`publisher.name`).
- `vscode-extensions.sh` — installs them all with `cat vscode.extensions | xargs -L 1 code --install-extension`. [[Installation Flow]] calls this.
- To refresh the list, dump the current ones: `code --list-extensions > vscode.extensions`.

## Curation notes

The list is deliberately trimmed of redundant extensions: the Python extension (`ms-python.python`) auto-installs Pylance and the debugger (`ms-python.debugpy`), so those aren't listed separately, and only one Prettier formatter is kept to avoid format-on-save conflicts. When refreshing the list with `code --list-extensions`, drop `ms-python.debugpy` again — it reappears in the dump because it's installed, but it's a dependency, not a top-level choice.

## A note on settings/keybindings

`settings.json` / `keybindings.json` are **not** in the repo — this machine didn't customize them. If you customize them later, you can track them here and symlink into `~/Library/Application Support/Code/User/`. VS Code's built-in **Settings Sync** is an alternative.
