# dotfiles

## Installation
(Optional) Set up an SSH key:

- `ssh-keygen -t ed25519 -C "your_email@example.com-<machine-descriptor>"`
- Add the output of `cat ~/.ssh/id_ed25519.pub` as a new SSH key at:
  - https://github.com/settings/keys

Run `./install`, then manually merge the config fragments as desired.

Install zellij:
```
curl -LO https://github.com/zellij-org/zellij/releases/download/v0.44.3/zellij-x86_64-unknown-linux-musl.tar.gz
tar -xvf zellij-x86_64-unknown-linux-musl.tar.gz
chmod +x zellij
sudo mv zellij /usr/local/bin/zellij
rm zellij-x86_64-unknown-linux-musl.tar.gz
```

Install neovim:
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
sudo apt install ripgrep fzf fd-find  # neovim dependencies
sudo apt install nodejs npm python3.12-venv  # mason dependencies
```

## Agent guidance

Reviewed guidance is version-controlled separately from automatic memory:

- `.agents/AGENTS.md` is the canonical instruction source, installed as both `~/.codex/AGENTS.md` and `~/.claude/CLAUDE.md`.
- `.agents/LEARNINGS.md` contains reviewed user preferences.

Manually merge `.claude/settings.fragment.json` and `.codex/config.fragment.toml` into the corresponding tool configuration files.

## Updating
Update my personal github dotfiles:
```
git remote set-url origin git@github.com:gordondowns/dotfiles.git
git remote -v
git fetch
*MAKE SURE THERE IS NO CONFIDENTIAL WORK INFO IN THE BRANCH OR ITS HISTORY*
git push origin <name-of-local-branch>:main
```
