#
# ~/.bash_profile
#

# Prefer a user-level zsh (`pixi global install zsh` on machines without admin rights),
# then a legacy miniforge one, then the system zsh.
ZSH_PATH="${HOME}/.pixi/bin/zsh"
[ -x "$ZSH_PATH" ] || ZSH_PATH="${HOME}/miniforge3/bin/zsh"
[ -x "$ZSH_PATH" ] || ZSH_PATH=$(command -v zsh 2>/dev/null) || ZSH_PATH=/bin/zsh
export SHELL="$ZSH_PATH"
exec "$ZSH_PATH" -l
