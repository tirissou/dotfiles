# Load compiled bytecode for faster startup
# module_path+=( "$HOME/.config/zsh/.zinit/mod-bin/Src/" )
# zmodload zdharma_continuum/zinit
# Load zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"
# Completion sources
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
# FPATH=$HOME/.config/zsh/completions/conda-zsh-completion:$FPATH
# FPATH=$HOME/.config/zsh/completions/xbrew:$FPATH
FPATH=$HOME/.config/zsh/completions:$FPATH
FPATH=$HOME/.zfunc:$FPATH


function docker-attach() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

zle -N docker-attach
bindkey ^p docker-attach

function conda-activate() {
  local env
  env=$(conda env list | sed 1,2d | cut -f 1 -d ' ' | fzf)
  echo "activating conda environment: $env"
  conda activate $env
}

zle -N conda-activate
bindkey ^o conda-activate


HISTFILE=$ZDOTDIR/history
HISTSIZE=10000
SAVEHIST=10000
# VIM BABY
bindkey -v

source $ZDOTDIR/alias.zsh
source $ZDOTDIR/shortcuts.zsh

setopt incappendhistory autocd extendedglob
# source $ZDOTDIR/zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zstyle :compinstall filename "$ZDOTDIR/.zshrc"

# Git
zinit snippet OMZ::plugins/git/git.plugin.zsh
# zinit snippet OMZ::plugins/docker/_docker
# Docker
zinit ice svn
zinit snippet PZT::modules/docker
# Python
# zinit ice svn silent wait"!0"
# zinit snippet PZT::modules/python
# zstyle ':prezto:module:python' skip-virtualenvwrapper-init 'on'
# zstyle ':prezto:module:python' conda-init 'on'
zinit ice pick"async.zsh" src"pure.zsh"
zinit ice silent wait"!0"
zinit light tirissou/pure
# Autosuggestions
zinit load zsh-users/zsh-autosuggestions
# Completions
zinit ice lucid wait"!0"
zinit load zsh-users/zsh-completions
# FZF
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin
# zinit pack for fzf
zinit ice pick'shell/completion.zsh' src'shell/key-bindings.zsh'
zinit load junegunn/fzf
# source $ZDOTDIR/fzf/bindings.zsh
# source $ZDOTDIR/fzf/completion.zsh



# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# __conda_setup="$('/Users/tibo/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/tibo/.miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/tibo/.miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/tibo/.miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tibo/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tibo/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/tibo/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tibo/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        java -version
 }
# Load completions
autoload -U compinit && compinit

# Direnv for local direcotry ENV setups
eval "$(direnv hook zsh)"
# Syntax highlighting
zinit ice lucid wait"!0"
zinit load zsh-users/zsh-syntax-highlighting

KEYTIMEOUT=5

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
eval "$(aws-vault --completion-script-zsh)"
