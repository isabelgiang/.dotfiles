# .dotfiles

## Initial setup on a new machine

Add the following to your shell configuration (i.e, `.bashrc`, `.zshrc`)

`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`

Add the folder where this repository will be cloned to a `.gitignore`

`echo ".dotfiles" >> .gitignore`

Clone the dotfiles into a bare repository:

`git clone --bare git@github.com:hollowsunsets/.dotfiles.git $HOME/.dotfiles`

Hide untracked files 
`dotfiles config --local status.showUntrackedFiles no`

Reference: https://www.atlassian.com/git/tutorials/dotfiles

