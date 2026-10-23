# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
	debian
	jsontools
	colored-man-pages
	extract
	pip
	python
	aliases
	you-should-use
	zsh-autosuggestions
	zsh-syntax-highlighting	 # this must be the last plugin to be enabled
	history-substring-search  # this must be the only plugin enabled AFTER zsh-syntax-highlighting
)

zstyle ':omz:plugins:alias-finder' autoload yes

source $ZSH/oh-my-zsh.sh

# env variables
YSU_MESSAGE_POSITION="after"  # alias suggestion position

# aliases
alias zshconfig="nano ~/.zshrc"
alias src="source ~/.zshrc"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias coa='conda activate'
alias cod='conda deactivate'
function coc() {
    if [[ -z "$1" ]]; then
        echo "Usage: coc [env_name] [python=version]"
        return 1
    fi

    local env_name="$1"
    local python_spec="python"
    if [[ "$2" == python=* ]]; then
        python_spec="python=${2#python=}"
    fi

    mamba create -y -n "$env_name" "$python_spec"
}
alias coi='mamba install'
alias cor='mamba env remove -n'

# conda/mamba: pure-shell setup, no Python or mamba binary spawned at startup
if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniforge3/etc/profile.d/conda.sh"
    export MAMBA_EXE="$HOME/miniforge3/bin/mamba"
    [ -f "$HOME/miniforge3/etc/profile.d/mamba.sh" ] && . "$HOME/miniforge3/etc/profile.d/mamba.sh"
    # Equivalent of `conda activate` (base) without running conda
    export PATH="$HOME/miniforge3/bin:$PATH" CONDA_PREFIX="$HOME/miniforge3" CONDA_DEFAULT_ENV=base CONDA_SHLVL=1
fi

export PATH="$HOME/.local/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
