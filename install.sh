#!/bin/bash
# This script installs the dotfiles from a bare git repository
# install omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# download dotfiles
function dotfiles {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .config-backup
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
dotfiles checkout
dotfiles config status.showUntrackedFiles no
# isntall fonts
fc-cache -f
# install plugins
dotfiles submodule init
dotfiles submodule update
# install thefuck
pip install https://github.com/nvbn/thefuck/archive/master.zip --user   
