#
# ~/.bash_profile
#

ZSH_PATH="${HOME}/miniforge3/bin/zsh"
[ -x "$ZSH_PATH" ] || ZSH_PATH=$(command -v zsh 2>/dev/null) || ZSH_PATH=/bin/zsh
export SHELL="$ZSH_PATH"
exec "$ZSH_PATH" -l
