# Dotfiles

## Set up

### 1. Install zsh

**With admin permissions:**
```sh
sudo apt install zsh        # Debian/Ubuntu
sudo dnf install zsh        # Fedora/RHEL
```

**Without admin permissions** (via [Miniforge](https://github.com/conda-forge/miniforge)):
```sh
conda install -c conda-forge zsh
```

`.bashrc` will automatically launch the right zsh: it looks for `~/miniforge3/bin/zsh` first, then falls back to whatever is in `$PATH`.

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
- Refresh the font cache
- Clone the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme and plugins: `zsh-syntax-highlighting`, `zsh-autosuggestions`, `you-should-use`

## Features

> This section may not reflect the latest state of `.zshrc`.

**Theme:** [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

**Plugins:** `zsh-syntax-highlighting`, `zsh-autosuggestions`, `you-should-use`, plus several built-in oh-my-zsh plugins (`git`, `extract`, `colored-man-pages`, …)

**Conda/mamba shortcuts:**

| Command | Description |
|---|---|
| `coa [env]` | Activate environment |
| `cod` | Deactivate environment |
| `coc <env> [python=x.y]` | Create a new environment (default: latest Python) |
| `coi <pkg>` | Install a package |
| `cor <env>` | Remove an environment |

## Keeping config files in sync

The install script **copies** files — edits to `~/` are not automatically reflected in the repo.

**Push local changes to the repo:**
```sh
cp ~/.zshrc ~/dotfiles/.zshrc
cp ~/.p10k.zsh ~/dotfiles/.p10k.zsh
cp ~/.bashrc ~/dotfiles/.bashrc
cd ~/dotfiles && git add . && git commit -m "chore: update configs" && git push
```

**Apply repo updates to `~/`:**
```sh
cd ~/dotfiles && git pull
for f in .[^.]*; do [ "$f" != ".git" ] && cp -ir "$f" ..; done
```
