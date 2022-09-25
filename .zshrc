# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Install powerline10k if it doesn't exist
if [[ ! -e ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/powerlevel10k.zsh-theme ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# oh-my-zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# oh-my-zsh plugins
plugins=(
  git docker arcanist colorize pip python brew macos zsh-fzf-history-search 
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

# Check machine environment
# https://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux
unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)   machine=Linux;;
  Darwin*)  machine=Mac;;
  CYGWIN*)  machine=Cygwin;;
  MINGW*)   machine="UNKNOWN:${unameOut}"
esac

# Source machine-specific aliases and environment variables
if [[ $machine == 'Mac' ]]; then
  host="$(scutil --get ComputerName)"
  if [[ $host == 'malachite' ]]; then
    source $HOME/.malachiterc
  fi
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Kitty autocompletion
autoload -Uz compinit
compinit
if [[ -f kitty ]]; then 
  kitty + complete setup zsh | source /dev/stdin
fi

# Start Python REPL with pypython
export PYTHONSTARTUP=$HOME/.pythonstartup

export PATH="/usr/local/sbin:$PATH:/usr/local/go/bin"
export PATH=$(go env GOPATH)/bin:$PATH

# Edit commands in Vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\ev' edit-command-line

# Open Typora from the command line
alias typora="open -a typora"

# Dotfiles management
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# Use Exuberant Ctags instead of default MacOS ctags
alias ctags="`brew --prefix`/bin/ctags"
alias generate-ctags='ctags --recurse=yes'

# Add Rust cargos to PATH
source $HOME/.cargo/env
eval "$(chef shell-init zsh)"
