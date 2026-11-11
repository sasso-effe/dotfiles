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

# pixi: global tools on PATH, plus completions. This has to come before oh-my-zsh,
# which runs compinit. pixi's own completion is cached into oh-my-zsh's completion
# dir and only regenerated when the pixi binary changes, so normally no process starts.
export PATH="$HOME/.pixi/bin:$PATH"
fpath+=("$HOME/.pixi/completions/zsh")
if [[ -x "$HOME/.pixi/bin/pixi" ]]; then
    _pixi_comp="${ZSH_CACHE_DIR:-$ZSH/cache}/completions/_pixi"
    if [[ ! -s "$_pixi_comp" || "$HOME/.pixi/bin/pixi" -nt "$_pixi_comp" ]]; then
        mkdir -p "${_pixi_comp:h}" && "$HOME/.pixi/bin/pixi" completion --shell zsh >| "$_pixi_comp"
    fi
    unset _pixi_comp
fi

source $ZSH/oh-my-zsh.sh

# env variables
YSU_MESSAGE_POSITION="after"  # alias suggestion position

# aliases
alias zshconfig="nano ~/.zshrc"
alias src="source ~/.zshrc"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pxs='pixi shell'
alias pxr='pixi run'
alias pxa='pixi add'

export PATH="$HOME/.local/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
