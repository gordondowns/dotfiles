# dotfiles

## Installation
`./install`
then manually install the config fragments as desired.

Install neovim:
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
```

## Updating
Update my personal github dotfiles:
```
git remote set-url origin git@github.com:gordondowns/dotfiles.git
git remote -v
git fetch
*MAKE SURE THERE IS NO CONFIDENTIAL WORK INFO IN THE BRANCH OR ITS HISTORY*
git push origin <name-of-local-branch>:main
```
