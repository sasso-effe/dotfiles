# Dotfiles

## Set up

You can simply run `./install.sh` or do it step by step:

 1. Install **zsh** if not present
 2. Install **omz** with:
    ```sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
 3. Copy the dotfiles to your home directory (`.git` is excluded):
    ```sh
    for f in .[^.]*; do [ "$f" != ".git" ] && cp -ir "$f" ..; done
    ```
 4. Install fonts with:
    ```sh
    fc-cache -f -r
    ```
 5. Install theme and plugins:
    ```sh
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
    pip install https://github.com/nvbn/thefuck/archive/master.zip --user
    ```

## Keeping config files in sync

The install script **copies** files from this repo into `~/`. The two locations are independent, so you need to manually keep them in sync.

### After editing files in `~/` directly

Copy the changed files back into the repo, then commit and push:

```sh
cp ~/.zshrc ~/dotfiles/.zshrc
cp ~/.p10k.zsh ~/dotfiles/.p10k.zsh
cp ~/.bashrc ~/dotfiles/.bashrc
# repeat for any other changed file
cd ~/dotfiles && git add . && git commit -m "update configs" && git push
```

### After pulling updates from the repo

Re-run the copy step to apply them to `~/`:

```sh
cd ~/dotfiles && git pull
for f in .[^.]*; do [ "$f" != ".git" ] && cp -ir "$f" ..; done
```
