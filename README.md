# Dotfiles

## Set up

You can simply run `./install.sh` or do it step by step:

 1. Install **zsh** if not present
 2. Install **omz** with:
    ```sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
 3. Copy the files in this repo on your machine
    ```sh
    cp -i -r .[^.]* ..
    ```
 5. Install fonts with
    ```sh
    fc-cache -f -r
    ```
 6. Install theme and plugins:
    ```sh
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
    pip install https://github.com/nvbn/thefuck/archive/master.zip --user
    ```
