# Neovim Configurations (Ubuntu 22.04)

## Install latest version of neovim

```shell
apt install software-properties-common
apt-add-repository ppa:neovim-ppa/unstable
apt update
apt install neovim
```

## Install Dependent Packages

```shell
apt install build-essential
apt install cmake
apt install golang
apt install python3-venv
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs
```

## Download this repository

```sh
[[ -d "$HOME/.config/nvim" ]] && mv "$HOME/.config/nvim" "$HOME/.config/nvim.bk"
git clone https://github.com/hanning0511/nvim-config.git "$HOME/.config/nvim"
```

## Initialize

- Initialize plugins, language servers.

```
:PackerSync
```

- Check plugins status

```
:Mason
```

## Known Issues

- If you see **libfzf.so not found** issue, try to do `make` in _~/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim_ folder.
