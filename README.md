# Dotfiles

## Set up

### 1. Install zsh

**With admin permissions:**
```sh
sudo apt install zsh        # Debian/Ubuntu
sudo dnf install zsh        # Fedora/RHEL
```

**Without admin permissions** (via [pixi](https://pixi.sh)):
```sh
curl -fsSL https://pixi.sh/install.sh | PIXI_NO_PATH_UPDATE=1 bash
~/.pixi/bin/pixi global install zsh
```

`.bashrc` will automatically launch the right zsh: it looks for `~/.pixi/bin/zsh` first, then a legacy `~/miniforge3/bin/zsh`, then falls back to whatever is in `$PATH`.

### 2. Run the install script

```sh
git clone https://github.com/sasso-effe/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh
```

The script will:
- Install [oh-my-zsh](https://ohmyzsh.sh)
- Copy the following files to `~/`, overwriting existing ones:
  - `.zshrc`, `.bashrc`, `.p10k.zsh`
  - `.config/Code/User/settings.json`
  - `.local/share/fonts/` (MesloLGS NF)
  - `.pixi/config.toml` (stops pixi editing the prompt; p10k shows the env instead)
- Install [pixi](https://pixi.sh) and these global tools with `pixi global install`:
  - `python` (3.12)
  - `build-tools`: `gcc`, `g++`, `binutils`, `make`, `cmake`
  - `speedtest-cli`
- Refresh the font cache
- Clone the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme and plugins: `zsh-syntax-highlighting`, `zsh-autosuggestions`, `you-should-use`

## Features

> This section may not reflect the latest state of `.zshrc`.

**Theme:** [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

**Plugins:** `zsh-syntax-highlighting`, `zsh-autosuggestions`, `you-should-use`, plus several built-in oh-my-zsh plugins (`git`, `extract`, `colored-man-pages`, …)

**pixi shortcuts** (pixi environments live in each project, next to its `pixi.toml`):

| Command | Description | Old conda equivalent |
|---|---|---|
| `pxs` | `pixi shell`: activate the project environment (`exit` to leave) | `coa` / `cod` |
| `pxr <task\|cmd>` | `pixi run`: run a task or command in the environment | |
| `pxa <pkg>` | `pixi add`: add a dependency | `coi` |
| `pixi init` + `pxa python` | Create a new project environment | `coc` |
| `pixi clean` | Delete the project's environments | `cor` |
| `pixi global install <pkg>` | Install a CLI tool for every shell | base env |

The p10k prompt has a custom `pixi` segment: a dim box icon when you are inside a pixi project, and the yellow project name once it's activated (`pyslam`, or `pyslam:dev` for a non-default env).

## Keeping config files in sync

The install script **copies** files — edits to `~/` are not automatically reflected in the repo.

**Push local changes to the repo:**
```sh
cp ~/.zshrc ~/dotfiles/.zshrc
cp ~/.p10k.zsh ~/dotfiles/.p10k.zsh
cp ~/.bashrc ~/dotfiles/.bashrc
cp ~/.pixi/config.toml ~/dotfiles/.pixi/config.toml
cd ~/dotfiles && git add . && git commit -m "chore: update configs" && git push
```

**Apply repo updates to `~/`:**
```sh
cd ~/dotfiles && git pull
for f in .[^.]*; do [ "$f" != ".git" ] && cp -ir "$f" ..; done
```
